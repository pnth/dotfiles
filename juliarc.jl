using Compat

const SEPARATOR = "\n\n" * "#"^80 * "\n\n"

ENV["PYTHON"] = ""
ENV["JULIA_WARN_COLOR"] = :yellow
ENV["JULIA_INFO_COLOR"] = :cyan
# ENV["LISP_PROMPT_TEXT"]  = "λ ↦ "

@static if is_windows()
    ENV["VS120COMNTOOLS"] = "C:\\Program Files (x86)\\Microsoft Visual Studio 12.0"
end

# Only 0.3.x
if v"0.3" <= VERSION < v"0.4-"
    quot(expr) = Expr(:quote, expr)
else
    @eval using Base.Meta: quot, show_sexpr

    macro sexpr(expr)
        :((show_sexpr($(quot(expr))); println()))
    end
end

macro suppress(block)
    quote
        if ccall(:jl_generating_output, Cint, ()) == 0
            ORIGINAL_STDOUT = STDOUT
            out_rd, out_wr = redirect_stdout()
            out_reader = @async readstring(out_rd)

            ORIGINAL_STDERR = STDERR
            err_rd, err_wr = redirect_stderr()
            err_reader = @async readstring(err_rd)

            value = $(esc(block))

            @async wait(out_reader)
            REDIRECTED_STDOUT = STDOUT
            out_stream =redirect_stdout(ORIGINAL_STDOUT)

            @async wait(err_reader)
            REDIRECTED_STDERR = STDERR
            err_stream = redirect_stderr(ORIGINAL_STDERR)

            return value
        end
    end
end

macro suppress_out(block)
    quote
        if ccall(:jl_generating_output, Cint, ()) == 0
            ORIGINAL_STDOUT = STDOUT
            out_rd, out_wr = redirect_stdout()
            out_reader = @async readstring(out_rd)

            value = $(esc(block))

            @async wait(out_reader)
            REDIRECTED_STDOUT = STDOUT
            out_stream = redirect_stdout(ORIGINAL_STDOUT)

            return value
        end
    end
end

macro suppress_err(block)
    quote
        if ccall(:jl_generating_output, Cint, ()) == 0
            ORIGINAL_STDERR = STDERR
            err_rd, err_wr = redirect_stderr()
            err_reader = @async readstring(err_rd)

            value = $(esc(block))

            @async wait(err_reader)
            REDIRECTED_STDERR = STDERR
            err_stream = redirect_stderr(ORIGINAL_STDERR)

            return value
        end
    end
end

function greedy_banner(io::IO = STDOUT)
    GIT_VERSION_INFO = Base.GIT_VERSION_INFO
    TAGGED_RELEASE_BANNER = Base.TAGGED_RELEASE_BANNER
    have_color = Base.have_color
    if GIT_VERSION_INFO.tagged_commit
        commit_string = TAGGED_RELEASE_BANNER
    elseif GIT_VERSION_INFO.commit == ""
        commit_string = ""
    else
        days = Int(floor((ccall(:jl_clock_now, Float64, ()) - GIT_VERSION_INFO.fork_master_timestamp) / (60 * 60 * 24)))
        days = max(0, days)
        unit = days == 1 ? "day" : "days"
        distance = GIT_VERSION_INFO.fork_master_distance
        commit = GIT_VERSION_INFO.commit_short

        if distance == 0
            commit_string = "Commit $(commit) ($(days) $(unit) old master)"
        else
            branch = GIT_VERSION_INFO.branch
            commit_string = "$(branch)/$(commit) (fork: $(distance) commits, $(days) $(unit))"
        end
    end
    commit_date = GIT_VERSION_INFO.date_string != "" ? " ($(GIT_VERSION_INFO.date_string))": ""

    if have_color
        tx = "\033[0m\033[1m" # text
        jl = "\033[0m\033[1m" # julia
        d1 = "\033[34m" # first dot
        d2 = "\033[31m" # second dot
        d3 = "\033[32m" # third dot
        d4 = "\033[35m" # fourth dot

        print(io,"""
        \033[1m               $(d3)_$(tx)
           $(d1)_$(tx)       $(jl)_$(tx) $(d2)_$(d3)(_)$(d4)_$(tx)     |  By greedy hackers for greedy hackers.
          $(d1)(_)$(jl)     | $(d2)(_)$(tx) $(d4)(_)$(tx)    |  Documentation: http://docs.julialang.org
           $(jl)_ _   _| |_  __ _$(tx)   |  Type \"?help\" for help.
          $(jl)| | | | | | |/ _' |$(tx)  |
          $(jl)| | |_| | | | (_| |$(tx)  |  Version $(VERSION)$(commit_date)
         $(jl)_/ |\\__'_|_|_|\\__'_|$(tx)  |  $(commit_string)
        $(jl)|__/$(tx)                   |  $(Sys.MACHINE)
        \033[0m
        """)
    else
        print(io,"""
                       _
           _       _ _(_)_     |  By greedy hackers for greedy hackers.
          (_)     | (_) (_)    |  Documentation: http://docs.julialang.org
           _ _   _| |_  __ _   |  Type \"?help\" for help.
          | | | | | | |/ _' |  |
          | | |_| | | | (_| |  |  Version $(VERSION)$(commit_date)
         _/ |\\__'_|_|_|\\__'_|  |  $(commit_string)
        |__/                   |  $(Sys.MACHINE)

        """)
    end
end

macro dump(expr)
    :(dump($(quot(expr))))
end

macro macroexpand(expr)
    :(macroexpand($(quot(expr))))
end

# [@eval $🔣() = run($🔡) for (🔣, 🔡) ∈ (:🐍 => `python`, :🐙 => `hy`, :λ => `clojure`, :💎 => `irb`, :💻 => `cling`, :🎮 => `nethack`)]

@eval begin
    "@import Foo as f"
    macro $(:import)(mod::Symbol, as::Symbol, alias::Symbol)
        as ≠ :as && error("@import expected `as` got `$as`")
        Expr(:toplevel, Expr(:import, mod), :(const $alias = $mod)) |> esc
    end

    "do-when (do-while) loop"
    macro $(:do)(block, when::Symbol, condition)
        when ≠ :when && error("@do expected `when` got `$s`")
        quote
            let
                $block
                while $condition
                    $block
                end
            end
        end |> esc
    end
end

"until loop"
macro until(condition, block)
    quote
        while !$condition
            $block
        end
    end |> esc
end

# Create sticky REPL functions for shell and help modes
const REPL_MODES_METADATA = @compat Dict(
    :shell => 2,
    :help => 3
)

for (repl_mode, mode_number) in REPL_MODES_METADATA
    sticky_mode = @compat Symbol(:sticky_, repl_mode, :_mode)
    @eval function $(sticky_mode)(enable::Bool = true)
        Base.active_repl.interface.modes[$mode_number].sticky = enable
    end
end

function recompile_packages()
    for pkg in keys(Pkg.installed())
        try
            info("Compiling: $pkg")
            eval(Expr(:toplevel, Expr(:using, Symbol(pkg))))
            println(SEPARATOR)
        catch err
            warn("Unable to precompile: $pkg")
            warn(err)
            println(SEPARATOR)
        end
    end
end

function update_winrpm()
    @static if is_windows()
        @eval using WinRPM
        WinRPM.update()
    end
end

# include(joinpath(JULIA_HOME, Base.DATAROOTDIR, "julia", "build_sysimg.jl"))

#=
function rebuild_userimg()
    img_path = joinpath(
        homedir(),
        ".julia",
        "v" * string(VERSION)[1:3],
        "userimg"
    )
    build_sysimg(
        img_path,
        "native",
        joinpath(homedir(), "userimg.jl"),
        force = true
    )
end
=#

function emerge()
    tic()
    Pkg.update()
    update_winrpm()
    Pkg.build()
    recompile_packages()
    # rebuild_userimg()
    toc()
end

macro methods(func::Symbol)
    :(methods($func))
end

# Simplify life when calling methodswith. I always do it wrong.
Base.methodswith(x, showparents::Bool=false) = methodswith(typeof(x), showparents)

macro methodswith(expr)
    :(methodswith($expr))
end

dir(directory = ".") = run(@static is_windows() ? `cmd /c dir $directory` : `ls $directory`)

const ls = dir

function setup()
    @async while true
        if isdefined(Base,:active_repl)
            greedy_banner()
            @sync begin
                @async sticky_shell_mode()
                @async sticky_help_mode()

                #= # versions 0.4.x, 0.5.x and 0.6.x =#
                #= if v"0.4" <= VERSION < v"0.7-" =#
                #=     @async @eval using PimpMyREPL =#
                #= end =#

                #= # Only 0.4.x =#
                #= if v"0.4" <= VERSION < v"0.5-" =#
                #=     @async begin =#
                #=         @eval begin =#
                #=             using LispREPL, LispSyntax =#
                #=             using Lazy: @>, @>> =#
                #=         end =#
                #=         LispREPL.initrepl(Base.active_repl) =#
                #=     end =#
                #= end =#
                Base.active_repl.interface.modes[1].prompt="> "

                # Only 0.5.x
                if v"0.5" <= VERSION < v"0.6-"
                    # @async @eval using Cxx
                end
            end

            break
        else
            sleep(0.001)
        end
    end

    #=
    if VERSION > v"0.4-"
    	const marcoexpand_keys = Dict{Any,Any}(
            "^I" => function (s, o...)
                if !isempty(s)
                    line = parse(Base.LineEdit.input_string(s))
                    s.kill_buffer=Base.LineEdit.input_string(s)
                    Base.LineEdit.edit_clear(s)
                    Base.LineEdit.edit_insert(s,string(macroexpand(line)))
                end
            end,
            "^O" => function(s, o...)
           	    Base.LineEdit.edit_clear(s)
           	    Base.LineEdit.edit_insert(Base.LineEdit.buffer(s),s.kill_buffer)
           	    Base.LineEdit.refresh_line(s)
           	end
        )

    	function customize_keys(repl)
          	repl.interface = Base.REPL.setup_interface(repl; extra_repl_keymap = marcoexpand_keys)
    	end

    	atreplinit(customize_keys)
    end
    =#

    cd()
    push!(LOAD_PATH, pwd())
end

setup()
