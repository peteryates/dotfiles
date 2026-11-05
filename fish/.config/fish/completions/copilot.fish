# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_copilot_global_optspecs
    string join \n effort= no-remote-export v/version i/interactive= fleet p/prompt= trust-folder s/silent disable-client-telemetry enable-memory model= reasoning-effort= context= auto-tier= enable-reasoning-summaries agent= r/resume= continue n/name= session-id= new-session-id= connect= cloud w/worktree= allow-all-tools allow-all-paths disallow-temp-dir banner screen-reader plain-diff C= log-dir= extension-sdk-path= config-dir= log-level= save-trajectory-output= prefer-version= stream= output-format= share= share-gist add-dir= attachment= disable-mcp-server= disable-builtin-mcps enable-all-github-mcp-tools add-github-mcp-toolset= add-github-mcp-tool= plugin-dir= additional-mcp-config= mcp-github-auth= allow-all-mcp-server-instructions additional-content-exclusion-policies= allow-tool= deny-tool= available-tools= excluded-tools= secret-env-vars= allow-url= deny-url= allow-all-urls allow-all yolo max-autopilot-continues= mode= autopilot plan experimental bash-env= mouse= show-timing server ui-server headless managed-server acp stdio host= disable-remote-sessions remote sync-session= port= session-idle-timeout= auth-token-env= log-interactive-shells print-debug-info collect-debug-logs= collect-debug-logs-output= ahp= ahp-authenticate= environment= host-environment= host-compute-id= host-ahp host-ahp-token= host-ahp-disable-token host-ahp-listen= host-directory= sandbox dynamic-retrieval= enable-mcp-server= max-ai-credits= assisted-approval embedded-host usage-output-file= no-custom-instructions no-auto-update no-ask-user no-color no-experimental no-bash-env no-mouse no-auto-login no-sandbox no-eager-powershell-resolution h/help
end

function __fish_copilot_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_copilot_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_copilot_using_subcommand
    set -l cmd (__fish_copilot_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c copilot -n "__fish_copilot_needs_command" -s i -l interactive -d 'Start interactive mode and automatically execute this prompt' -r
complete -c copilot -n "__fish_copilot_needs_command" -s p -l prompt -d 'Execute a prompt in non-interactive mode (exits after completion)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l model -d 'Set the AI model to use (use \'auto\' to let Copilot pick automatically)' -r -f -a "auto\t''
claude-sonnet-5.5\t''
claude-sonnet-5\t''
claude-fable-5.1\t''
claude-fable-5\t''
claude-opus-5.5\t''
claude-opus-5\t''
claude-opus-4.8\t''
claude-opus-4.8-fast\t''
claude-sonnet-4.6\t''
claude-haiku-5.5\t''
claude-haiku-4.5\t''
gpt-6.1-sol\t''
gpt-6-sol\t''
gpt-6-luna\t''
gpt-6-astra\t''
gpt-5.6-sol\t''
gpt-5.6-terra\t''
gpt-5.6-luna\t''
gpt-5.5\t''
gpt-5.4\t''
gpt-5.4-mini\t''
gpt-5.3-codex\t''
gpt-5-mini\t''
mai-code-1.1-flash\t''
gemini-4-argon\t''
gemini-3.8-flash\t''
gemini-3.7-flash\t''
grok-4.7\t''
grok-4.6\t''
grok-4.5\t''
kimi-k3\t''"
complete -c copilot -n "__fish_copilot_needs_command" -l reasoning-effort -d 'Set the reasoning effort level' -r -f -a "none\t''
minimal\t''
low\t''
medium\t''
high\t''
xhigh\t''
max\t''"
complete -c copilot -n "__fish_copilot_needs_command" -l context -d 'Set the context window tier (overrides persisted setting)' -r -f -a "default\t''
long_context\t''"
complete -c copilot -n "__fish_copilot_needs_command" -l auto-tier -d 'Set the Auto routing profile (validated against the available catalog)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l agent -d 'Specify a custom agent to use' -r
complete -c copilot -n "__fish_copilot_needs_command" -s r -l resume -d 'Resume from a previous session (optionally specify existing session ID, task ID, ID prefix, or name; name matching is exact, case-insensitive)' -r
complete -c copilot -n "__fish_copilot_needs_command" -s n -l name -d 'Set a name for the new session' -r
complete -c copilot -n "__fish_copilot_needs_command" -l session-id -d 'Resume an existing session or task by ID, or set the UUID for a new session' -r
complete -c copilot -n "__fish_copilot_needs_command" -l new-session-id -d 'Create a new local session with the supplied UUID' -r
complete -c copilot -n "__fish_copilot_needs_command" -l connect -d 'Connect directly to a remote session (optionally specify session ID or task ID)' -r
complete -c copilot -n "__fish_copilot_needs_command" -s w -l worktree -d 'Create or reuse an isolated git worktree and start the session inside it (name is optional; the location follows the worktreePathTemplate setting)' -r
complete -c copilot -n "__fish_copilot_needs_command" -s C -d 'Change working directory before doing anything else' -r
complete -c copilot -n "__fish_copilot_needs_command" -l log-dir -d 'Set log file directory (default: ~/.copilot/logs/)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l extension-sdk-path -d 'Override the bundled @github/copilot-sdk injected into extension subprocesses with a local `copilot-sdk/` folder. Invalid paths fall back to the bundled SDK.' -r
complete -c copilot -n "__fish_copilot_needs_command" -l config-dir -d 'Set the configuration directory (default: ~/.copilot). Deprecated: use COPILOT_HOME env var instead.' -r
complete -c copilot -n "__fish_copilot_needs_command" -l log-level -d 'Set the log level' -r -f -a "none\t''
error\t''
warning\t''
info\t''
debug\t''
all\t''
default\t''"
complete -c copilot -n "__fish_copilot_needs_command" -l save-trajectory-output -d 'Save execution trajectory to specified file' -r
complete -c copilot -n "__fish_copilot_needs_command" -l prefer-version -d 'Load a specific cached package version (used by /downgrade)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l stream -d 'Enable or disable streaming mode' -r -f -a "on\t''
off\t''"
complete -c copilot -n "__fish_copilot_needs_command" -l output-format -d 'Output format: \'text\' (default) or \'json\' (JSONL, one JSON object per line)' -r -f -a "text\t''
json\t''"
complete -c copilot -n "__fish_copilot_needs_command" -l share -d 'Share session to markdown file after completion in non-interactive mode (default: ./copilot-session-<id>.md)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l add-dir -d 'Allow file access to a directory and load its .github/skills and .github/agents as trusted configuration (can be used multiple times). A relative path resolves against the session working directory (the --resume/--worktree/-C directory), whatever order the options appear in' -r
complete -c copilot -n "__fish_copilot_needs_command" -l attachment -d 'Attach a file (image or native document) to the initial prompt; only valid in non-interactive mode (can be used multiple times)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l disable-mcp-server -d 'Disable a specific MCP server (can be used multiple times)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l add-github-mcp-toolset -d 'Add a toolset to enable for the GitHub MCP server instead of the default CLI subset (can be used multiple times). Use "all" for all toolsets.' -r
complete -c copilot -n "__fish_copilot_needs_command" -l add-github-mcp-tool -d 'Add a tool to enable for the GitHub MCP server instead of the default CLI subset (can be used multiple times). Use "*" for all tools.' -r
complete -c copilot -n "__fish_copilot_needs_command" -l plugin-dir -d 'Load a plugin from a local directory (can be used multiple times). A relative path resolves against the session working directory (the --resume/--worktree/-C directory), whatever order the options appear in' -r
complete -c copilot -n "__fish_copilot_needs_command" -l additional-mcp-config -d 'Additional MCP servers configuration as JSON string or file path (prefix with @) (can be used multiple times; augments config from ~/.copilot/mcp-config.json for this session). A relative @ path resolves against the session working directory (the --resume/--worktree/-C directory) and a leading ~/ expands to your home directory' -r
complete -c copilot -n "__fish_copilot_needs_command" -l mcp-github-auth -d 'Send the signed-in GitHub account credential only to this explicit --additional-mcp-config server and approved origin. HTTPS is required except for literal loopback HTTP. Never put a token in this argument. Can be used multiple times.' -r
complete -c copilot -n "__fish_copilot_needs_command" -l additional-content-exclusion-policies -d 'Additional content exclusion policies as JSON string or file path (prefix with @) (can be used multiple times)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l allow-tool -d 'Tools the CLI has permission to use; will not prompt for permission' -r
complete -c copilot -n "__fish_copilot_needs_command" -l deny-tool -d 'Tools the CLI does not have permission to use; will not prompt for permission' -r
complete -c copilot -n "__fish_copilot_needs_command" -l available-tools -d 'Only these tools will be available to the model' -r
complete -c copilot -n "__fish_copilot_needs_command" -l excluded-tools -d 'These tools will not be available to the model' -r
complete -c copilot -n "__fish_copilot_needs_command" -l secret-env-vars -d 'Environment variable names whose values are stripped from shell and MCP server environments and redacted from output (e.g., --secret-env-vars=MY_KEY,OTHER_KEY)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l allow-url -d 'Allow access to specific URLs or domains' -r
complete -c copilot -n "__fish_copilot_needs_command" -l deny-url -d 'Deny access to specific URLs or domains, takes precedence over --allow-url' -r
complete -c copilot -n "__fish_copilot_needs_command" -l max-autopilot-continues -d 'Maximum number of continuation messages in autopilot mode' -r
complete -c copilot -n "__fish_copilot_needs_command" -l mode -d 'Set the initial agent mode' -r -f -a "interactive\t''
plan\t''
autopilot\t''"
complete -c copilot -n "__fish_copilot_needs_command" -l bash-env -d 'Enable BASH_ENV support for bash shells (on|off)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l mouse -d 'Enable mouse support in alt screen mode (on|off)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l host -d 'Host address to bind server to (default: 127.0.0.1)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l sync-session -d 'Enable or disable read-only account history sync for this run only (omitted: use configured/default behavior). Without a value, enables sync; does not enable incoming control.' -r -f -a "on\t''
off\t''"
complete -c copilot -n "__fish_copilot_needs_command" -l port -d 'Port to listen on when in server mode (default: random available port)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l session-idle-timeout -d 'Session idle timeout in seconds (0 = disabled)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l auth-token-env -d 'Read auth token from specified environment variable (for SDK use)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l collect-debug-logs -d 'Collect debug logs for a session and save to a .tgz file' -r
complete -c copilot -n "__fish_copilot_needs_command" -l collect-debug-logs-output -d 'Output path for --collect-debug-logs (default: copilot-debug-logs-<sessionId>.tgz in cwd)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l ahp -d 'Experimental: attach to an Agent Host Protocol host and run its sessions (default: ws://127.0.0.1:8765)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l ahp-authenticate -d 'Experimental: share your GitHub credential with the --ahp servers for this launch using scheme github. Enable only for servers you trust. Off by default; requires --ahp.' -r -f -a "github\t''"
complete -c copilot -n "__fish_copilot_needs_command" -l environment -d 'Experimental: connect to an existing Mission Control environment' -r
complete -c copilot -n "__fish_copilot_needs_command" -l host-environment -d 'Start a headless Mission Control environment (no local listener unless --host-ahp is also set)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l host-compute-id -d 'Stable environment compute identity override (default: generate, persist, and reuse the CLI identity)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l host-ahp-token -d 'Use a fixed, nonempty local connection token for --host-ahp (default: random required token). Visible in process arguments and shell history. GitHub authentication is still required.' -r
complete -c copilot -n "__fish_copilot_needs_command" -l host-ahp-listen -d 'Address --host-ahp binds, as host:port' -r
complete -c copilot -n "__fish_copilot_needs_command" -l host-directory -d 'Hosted runtime working directory (default: current working directory)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l dynamic-retrieval -d 'Enable or disable embeddings-based dynamic retrieval per category and persist the choice (category: skills). Repeatable, e.g. --dynamic-retrieval skills=off' -r
complete -c copilot -n "__fish_copilot_needs_command" -l enable-mcp-server -d 'Enable an MCP server disabled in settings for this run only; nothing is persisted (can be used multiple times)' -r
complete -c copilot -n "__fish_copilot_needs_command" -l max-ai-credits -d 'Set max AI credits for this session' -r
complete -c copilot -n "__fish_copilot_needs_command" -l usage-output-file -d 'Write final usage statistics as JSON to the specified file' -r
complete -c copilot -n "__fish_copilot_needs_command" -s v -l version -d 'show version information'
complete -c copilot -n "__fish_copilot_needs_command" -l fleet -d 'Run the prompt in fleet mode (parallel subagent orchestration); combine with -i, -p, or piped stdin'
complete -c copilot -n "__fish_copilot_needs_command" -l trust-folder -d 'Trust the resolved working directory\'s configuration for one new prompt-mode session only (no saved trust or tool, path, or URL approvals)'
complete -c copilot -n "__fish_copilot_needs_command" -s s -l silent -d 'Output only the agent response (no stats), useful for scripting with -p'
complete -c copilot -n "__fish_copilot_needs_command" -l disable-client-telemetry -d 'Disable telemetry sent by the CLI (does not affect server-side telemetry)'
complete -c copilot -n "__fish_copilot_needs_command" -l enable-memory -d 'Enable memory in prompt mode (disabled by default)'
complete -c copilot -n "__fish_copilot_needs_command" -l enable-reasoning-summaries -d 'Deprecated compatibility flag (accepted but ignored)'
complete -c copilot -n "__fish_copilot_needs_command" -l continue -d 'Resume the most recent session'
complete -c copilot -n "__fish_copilot_needs_command" -l cloud -d 'Create a cloud sandbox session and connect to it'
complete -c copilot -n "__fish_copilot_needs_command" -l allow-all-tools -d 'Allow all tools to run automatically without confirmation; required for non-interactive mode. Run `copilot help environment` for what COPILOT_ALLOW_ALL accepts and what exact "true" grants'
complete -c copilot -n "__fish_copilot_needs_command" -l allow-all-paths -d 'Disable file path verification and allow access to any path'
complete -c copilot -n "__fish_copilot_needs_command" -l disallow-temp-dir -d 'Prevent automatic access to the system temporary directory'
complete -c copilot -n "__fish_copilot_needs_command" -l banner -d 'Show the startup banner'
complete -c copilot -n "__fish_copilot_needs_command" -l screen-reader -d 'Enable screen reader optimizations'
complete -c copilot -n "__fish_copilot_needs_command" -l plain-diff -d 'Disable rich diff rendering (syntax highlighting via diff tool specified by git config)'
complete -c copilot -n "__fish_copilot_needs_command" -l share-gist -d 'Share session to a secret GitHub gist after completion in non-interactive mode'
complete -c copilot -n "__fish_copilot_needs_command" -l disable-builtin-mcps -d 'Disable all built-in MCP servers (currently: github-mcp-server, githubiq)'
complete -c copilot -n "__fish_copilot_needs_command" -l enable-all-github-mcp-tools -d 'Enable all GitHub MCP server tools instead of the default CLI subset. Overrides --add-github-mcp-toolset and --add-github-mcp-tool options.'
complete -c copilot -n "__fish_copilot_needs_command" -l allow-all-mcp-server-instructions -d 'Include initialization instructions from all MCP servers in the system prompt instead of only allowlisted servers'
complete -c copilot -n "__fish_copilot_needs_command" -l allow-all-urls -d 'Allow access to all URLs without confirmation'
complete -c copilot -n "__fish_copilot_needs_command" -l allow-all -d 'Enable all permissions (equivalent to --allow-all-tools --allow-all-paths --allow-all-urls)'
complete -c copilot -n "__fish_copilot_needs_command" -l yolo -d 'Enable all permissions (equivalent to --allow-all-tools --allow-all-paths --allow-all-urls)'
complete -c copilot -n "__fish_copilot_needs_command" -l autopilot -d 'Start in autopilot mode'
complete -c copilot -n "__fish_copilot_needs_command" -l plan -d 'Start in plan mode (combine with --mode autopilot to auto-approve the plan and implement it autonomously)'
complete -c copilot -n "__fish_copilot_needs_command" -l experimental -d 'Enable experimental features'
complete -c copilot -n "__fish_copilot_needs_command" -l show-timing -d 'Show LLM turn duration timing information. For accurate tool timing, consider using --allow-all-tools to avoid confirmation delays.'
complete -c copilot -n "__fish_copilot_needs_command" -l server -d 'Enable headless JSON-RPC server mode'
complete -c copilot -n "__fish_copilot_needs_command" -l ui-server -d 'Enable TUI with embedded JSON-RPC server'
complete -c copilot -n "__fish_copilot_needs_command" -l headless -d 'Enable headless JSON-RPC server mode (alias for --server)'
complete -c copilot -n "__fish_copilot_needs_command" -l managed-server -d 'Bootstrap a managed-server session under headless --server so a controller\'s attach picker can drive it'
complete -c copilot -n "__fish_copilot_needs_command" -l acp -d 'Start as Agent Client Protocol server'
complete -c copilot -n "__fish_copilot_needs_command" -l stdio -d 'Use stdio transport for server mode (instead of TCP)'
complete -c copilot -n "__fish_copilot_needs_command" -l disable-remote-sessions -d 'Disable remote session access'
complete -c copilot -n "__fish_copilot_needs_command" -l log-interactive-shells -d 'Log raw PTY data from interactive shell sessions'
complete -c copilot -n "__fish_copilot_needs_command" -l print-debug-info -d 'Print CLI version, terminal capabilities, and detection-related env vars, then exit'
complete -c copilot -n "__fish_copilot_needs_command" -l host-ahp -d 'Experimental: serve AHP 1.0 with copilotd\'s in-process backend'
complete -c copilot -n "__fish_copilot_needs_command" -l host-ahp-disable-token -d 'Disable only the local connection token for --host-ahp. GitHub authentication and authorization are still required.'
complete -c copilot -n "__fish_copilot_needs_command" -l sandbox -d 'Run this session\'s shell commands inside the OS-level sandbox for this run only (does not change your saved sandbox setting)'
complete -c copilot -n "__fish_copilot_needs_command" -l assisted-approval -d 'Review tool permission requests with the assisted-approval safety judge instead of approving them outright. The judge is probabilistic and not a security boundary. Equivalent to the `assisted` mode of /permissions. Takes precedence over --allow-all-tools when the judge engages. Ignored, with a warning, when AUTO_APPROVAL is explicitly disabled or managed policy blocks it. (env: COPILOT_ASSISTED_APPROVAL)'
complete -c copilot -n "__fish_copilot_needs_command" -l embedded-host -d 'Run as an in-process FFI embedded host (Rust engine driven over the C ABI; no stdio/TCP transport)'
complete -c copilot -n "__fish_copilot_needs_command" -l no-custom-instructions -d 'Disable loading of custom instructions from AGENTS.md and related files'
complete -c copilot -n "__fish_copilot_needs_command" -l no-auto-update -d 'Disable downloading CLI updates automatically. Copilot then runs the version bundled in the executable you launched rather than a newer previously downloaded one'
complete -c copilot -n "__fish_copilot_needs_command" -l no-ask-user -d 'Disable the ask_user tool (agent works autonomously without asking questions)'
complete -c copilot -n "__fish_copilot_needs_command" -l no-color -d 'Disable all color output'
complete -c copilot -n "__fish_copilot_needs_command" -l no-experimental -d 'Disable experimental features'
complete -c copilot -n "__fish_copilot_needs_command" -l no-bash-env -d 'Disable BASH_ENV support for bash shells'
complete -c copilot -n "__fish_copilot_needs_command" -l no-mouse -d 'Disable mouse support in alt screen mode'
complete -c copilot -n "__fish_copilot_needs_command" -l no-auto-login -d 'Disable automatic login detection (stored OAuth tokens and gh CLI)'
complete -c copilot -n "__fish_copilot_needs_command" -l no-sandbox -d 'Disable the OS-level sandbox for this run only (does not change your saved sandbox setting)'
complete -c copilot -n "__fish_copilot_needs_command" -l no-eager-powershell-resolution -d 'Disable background PowerShell prompt resolution on Windows'
complete -c copilot -n "__fish_copilot_needs_command" -s h -l help -d 'Print help'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "app" -d 'Open the GitHub Copilot app'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "login" -d 'Authenticate with Copilot'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "help" -d 'Display help information'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "init" -d 'Initialize Copilot instructions'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "config" -d 'Manage configuration settings'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "update" -d 'Download the latest version'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "version" -d 'Display version information'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "workflow" -d 'Run dynamic workflows'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "sessions" -d 'Manage saved sessions'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "memories" -d 'Manage memories'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "plugin" -d 'Manage plugins'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "mcp" -d 'Manage MCP servers'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "skill" -d 'Manage skills'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "instruction" -d 'Inspect instruction sources'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "lsp" -d 'Inspect language server configuration'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "sandbox" -d 'Manage command sandboxing'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "taskbar-selftest" -d 'Diagnose the Windows taskbar-presence (Forerunner) pipeline'
complete -c copilot -n "__fish_copilot_needs_command" -f -a "completion" -d 'Generate a shell completion script'
complete -c copilot -n "__fish_copilot_using_subcommand app" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand login" -l host -d 'GitHub host URL (default: https://github.com)' -r
complete -c copilot -n "__fish_copilot_using_subcommand login" -l config-dir -d 'Set the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand login" -l device-code -d 'Authenticate using the OAuth device code flow (default in remote or headless environments)'
complete -c copilot -n "__fish_copilot_using_subcommand login" -l web-flow -d 'Authenticate using the browser (web) flow (default on local desktops)'
complete -c copilot -n "__fish_copilot_using_subcommand login" -l with-token -d 'Read an authentication token from standard input'
complete -c copilot -n "__fish_copilot_using_subcommand login" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand init" -l disable-client-telemetry -d 'Disable telemetry sent by the CLI (does not affect server-side telemetry)'
complete -c copilot -n "__fish_copilot_using_subcommand init" -l sandbox -d 'Run this session\'s shell commands inside the OS-level sandbox for this run only (does not change your saved sandbox setting)'
complete -c copilot -n "__fish_copilot_using_subcommand init" -l experimental -d 'Enable experimental features'
complete -c copilot -n "__fish_copilot_using_subcommand init" -l no-sandbox -d 'Disable the OS-level sandbox for this run only (does not change your saved sandbox setting)'
complete -c copilot -n "__fish_copilot_using_subcommand init" -l no-experimental -d 'Disable experimental features'
complete -c copilot -n "__fish_copilot_using_subcommand init" -l no-eager-powershell-resolution -d 'Disable background PowerShell prompt resolution on Windows'
complete -c copilot -n "__fish_copilot_using_subcommand init" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand config" -l list -d 'List settings as key=value lines'
complete -c copilot -n "__fish_copilot_using_subcommand config" -l rm -d 'Remove the key, or only the given item from a list'
complete -c copilot -n "__fish_copilot_using_subcommand config" -l json -d 'Output --list as JSON'
complete -c copilot -n "__fish_copilot_using_subcommand config" -l global -d 'Use your user settings file (the default)'
complete -c copilot -n "__fish_copilot_using_subcommand config" -l repo -d 'Use the repository\'s .github/copilot/settings.json'
complete -c copilot -n "__fish_copilot_using_subcommand config" -l local -d 'Use the repository\'s .github/copilot/settings.local.json'
complete -c copilot -n "__fish_copilot_using_subcommand config" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand version" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand workflow; and not __fish_seen_subcommand_from run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand workflow; and not __fish_seen_subcommand_from run" -f -a "run" -d 'Run a registered dynamic workflow'
complete -c copilot -n "__fish_copilot_using_subcommand workflow; and __fish_seen_subcommand_from run" -l args -d 'Workflow arguments as inline JSON or an @-prefixed JSON file' -r
complete -c copilot -n "__fish_copilot_using_subcommand workflow; and __fish_seen_subcommand_from run" -l result-file -d 'Write only the workflow result to this JSON file' -r
complete -c copilot -n "__fish_copilot_using_subcommand workflow; and __fish_seen_subcommand_from run" -l output-format -d 'Output format: \'text\' (default) or \'json\' (JSONL)' -r -f -a "text\t''
json\t''"
complete -c copilot -n "__fish_copilot_using_subcommand workflow; and __fish_seen_subcommand_from run" -s s -l silent -d 'Suppress workflow progress output'
complete -c copilot -n "__fish_copilot_using_subcommand workflow; and __fish_seen_subcommand_from run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand sessions; and not __fish_seen_subcommand_from import" -s h -l help -d 'Print help'
complete -c copilot -n "__fish_copilot_using_subcommand sessions; and not __fish_seen_subcommand_from import" -f -a "import" -d 'Import a semantic session from JSONL'
complete -c copilot -n "__fish_copilot_using_subcommand sessions; and __fish_seen_subcommand_from import" -l output -d 'Output format' -r -f -a "json\t''"
complete -c copilot -n "__fish_copilot_using_subcommand sessions; and __fish_seen_subcommand_from import" -l working-directory -d 'Override the imported working directory' -r
complete -c copilot -n "__fish_copilot_using_subcommand sessions; and __fish_seen_subcommand_from import" -l name -d 'Override the imported session name' -r
complete -c copilot -n "__fish_copilot_using_subcommand sessions; and __fish_seen_subcommand_from import" -l dry-run -d 'Validate without writing a session'
complete -c copilot -n "__fish_copilot_using_subcommand sessions; and __fish_seen_subcommand_from import" -s h -l help -d 'Print help'
complete -c copilot -n "__fish_copilot_using_subcommand memories; and not __fish_seen_subcommand_from import" -s h -l help -d 'Print help'
complete -c copilot -n "__fish_copilot_using_subcommand memories; and not __fish_seen_subcommand_from import" -f -a "import" -d 'Import semantic memories through the native memory service'
complete -c copilot -n "__fish_copilot_using_subcommand memories; and __fish_seen_subcommand_from import" -l output -d 'Output format' -r -f -a "json\t''"
complete -c copilot -n "__fish_copilot_using_subcommand memories; and __fish_seen_subcommand_from import" -l on-conflict -d 'Conflict behavior' -r -f -a "skip\t''
error\t''"
complete -c copilot -n "__fish_copilot_using_subcommand memories; and __fish_seen_subcommand_from import" -l dry-run -d 'Validate without submitting memories'
complete -c copilot -n "__fish_copilot_using_subcommand memories; and __fish_seen_subcommand_from import" -s h -l help -d 'Print help'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall update list enable disable marketplace" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall update list enable disable marketplace" -f -a "install" -d 'Install a plugin'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall update list enable disable marketplace" -f -a "uninstall" -d 'Uninstall a plugin'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall update list enable disable marketplace" -f -a "update" -d 'Update a plugin'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall update list enable disable marketplace" -f -a "list" -d 'List installed and --plugin-dir plugins'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall update list enable disable marketplace" -f -a "enable" -d 'Enable a plugin'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall update list enable disable marketplace" -f -a "disable" -d 'Disable a plugin'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall update list enable disable marketplace" -f -a "marketplace" -d 'Manage plugin marketplaces'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from install" -l from-github -d 'Install a verified Skill or plugin from GitHub by its resource and revision IDs' -r
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from install" -l descriptor-digest -d 'Descriptor digest for --from-github' -r
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from install" -l bundle-digest -d 'Bundle digest for --from-github' -r
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from install" -l schema-version -d 'Descriptor schema version for --from-github (default: 1.0.0)' -r
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from install" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from uninstall" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from update" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from update" -l all -d 'Update all installed plugins'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from list" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from list" -l json -d 'Output as JSON'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from enable" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from enable" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from disable" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from disable" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from marketplace" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from marketplace" -f -a "add" -d 'Add a marketplace'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from marketplace" -f -a "remove" -d 'Remove a marketplace'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from marketplace" -f -a "list" -d 'List registered marketplaces'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from marketplace" -f -a "browse" -d 'Browse plugins in a marketplace'
complete -c copilot -n "__fish_copilot_using_subcommand plugin; and __fish_seen_subcommand_from marketplace" -f -a "update" -d 'Update marketplace plugin catalogs'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove enable disable" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove enable disable" -f -a "list" -d 'List configured MCP servers'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove enable disable" -f -a "get" -d 'Show server details'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove enable disable" -f -a "add" -d 'Add an MCP server'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove enable disable" -f -a "remove" -d 'Remove an MCP server'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove enable disable" -f -a "enable" -d 'Enable an MCP server'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove enable disable" -f -a "disable" -d 'Disable an MCP server'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from list" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from list" -l json -d 'Output as JSON'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from get" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from get" -l json -d 'Output as JSON'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from get" -l show-secrets -d 'Show full environment variable and header values (masked by default)'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from add" -l transport -d 'Server transport' -r -f -a "stdio\t''
http\t''
sse\t''"
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from add" -l env -d 'Environment variable (KEY=VALUE, can be repeated)' -r
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from add" -l header -d 'HTTP header for remote servers, can be repeated' -r
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from add" -l tools -d 'Tool filter: "*" for all, comma-separated list, or "" for none' -r
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from add" -l timeout -d 'Timeout in milliseconds (1-4294967295)' -r
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from add" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from add" -l json -d 'Output added config as JSON'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from add" -l show-secrets -d 'Show full environment variable and header values in output, masked by default'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from remove" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from enable" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from enable" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from disable" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand mcp; and __fish_seen_subcommand_from disable" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and not __fish_seen_subcommand_from list add remove enable disable" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and not __fish_seen_subcommand_from list add remove enable disable" -f -a "list" -d 'List available skills'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and not __fish_seen_subcommand_from list add remove enable disable" -f -a "add" -d 'Add a skill from a file, URL, or directory'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and not __fish_seen_subcommand_from list add remove enable disable" -f -a "remove" -d 'Remove a skill or custom skill directory'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and not __fish_seen_subcommand_from list add remove enable disable" -f -a "enable" -d 'Enable a skill'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and not __fish_seen_subcommand_from list add remove enable disable" -f -a "disable" -d 'Disable a skill'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and __fish_seen_subcommand_from list" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand skill; and __fish_seen_subcommand_from list" -l json -d 'Output as JSON'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and __fish_seen_subcommand_from add" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand skill; and __fish_seen_subcommand_from add" -l project -d 'Install the skill into the project\'s .github/skills directory'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and __fish_seen_subcommand_from remove" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand skill; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and __fish_seen_subcommand_from enable" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand skill; and __fish_seen_subcommand_from enable" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand skill; and __fish_seen_subcommand_from disable" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand skill; and __fish_seen_subcommand_from disable" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand instruction; and not __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand instruction; and not __fish_seen_subcommand_from list" -f -a "list" -d 'List discovered instruction sources'
complete -c copilot -n "__fish_copilot_using_subcommand instruction; and __fish_seen_subcommand_from list" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand instruction; and __fish_seen_subcommand_from list" -l json -d 'Output as JSON'
complete -c copilot -n "__fish_copilot_using_subcommand instruction; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand lsp; and not __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand lsp; and not __fish_seen_subcommand_from list" -f -a "list" -d 'List configured language servers'
complete -c copilot -n "__fish_copilot_using_subcommand lsp; and __fish_seen_subcommand_from list" -l config-dir -d 'Path to the configuration directory (deprecated: use COPILOT_HOME env var)' -r
complete -c copilot -n "__fish_copilot_using_subcommand lsp; and __fish_seen_subcommand_from list" -l json -d 'Output as JSON'
complete -c copilot -n "__fish_copilot_using_subcommand lsp; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand sandbox; and not __fish_seen_subcommand_from ca" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand sandbox; and not __fish_seen_subcommand_from ca" -f -a "ca" -d 'Manage the credential proxy certificate authority'
complete -c copilot -n "__fish_copilot_using_subcommand sandbox; and __fish_seen_subcommand_from ca" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand sandbox; and __fish_seen_subcommand_from ca" -f -a "status" -d 'Show whether the OS trusts the certificate authority'
complete -c copilot -n "__fish_copilot_using_subcommand sandbox; and __fish_seen_subcommand_from ca" -f -a "rotate" -d 'Replace the certificate authority'
complete -c copilot -n "__fish_copilot_using_subcommand sandbox; and __fish_seen_subcommand_from ca" -f -a "remove" -d 'Remove the certificate authority from OS trust'
complete -c copilot -n "__fish_copilot_using_subcommand sandbox; and __fish_seen_subcommand_from ca" -f -a "create" -d 'Create the certificate authority without trusting it'
complete -c copilot -n "__fish_copilot_using_subcommand sandbox; and __fish_seen_subcommand_from ca" -f -a "trust" -d 'Add the certificate authority to OS trust'
complete -c copilot -n "__fish_copilot_using_subcommand taskbar-selftest" -l strict -d 'Exit non-zero unless tasks.json was actually written'
complete -c copilot -n "__fish_copilot_using_subcommand taskbar-selftest" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -n "__fish_copilot_using_subcommand completion" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c copilot -l model -r -f -a 'auto claude-sonnet-5.5 claude-sonnet-5 claude-fable-5.1 claude-fable-5 claude-opus-5.5 claude-opus-5 claude-opus-4.8 claude-opus-4.8-fast claude-sonnet-4.6 claude-haiku-5.5 claude-haiku-4.5 gpt-6.1-sol gpt-6-sol gpt-6-luna gpt-6-astra gpt-5.6-sol gpt-5.6-terra gpt-5.6-luna gpt-5.5 gpt-5.4 gpt-5.4-mini gpt-5.3-codex gpt-5-mini mai-code-1.1-flash gemini-4-argon gemini-3.8-flash gemini-3.7-flash grok-4.7 grok-4.6 grok-4.5 kimi-k3'
complete -c copilot -l reasoning-effort -r -f -a 'none minimal low medium high xhigh max'
complete -c copilot -l context -r -f -a 'default long_context'
complete -c copilot -l log-level -r -f -a 'none error warning info debug all default'
complete -c copilot -l stream -r -f -a 'on off'
complete -c copilot -l output-format -r -f -a 'text json'
complete -c copilot -l mode -r -f -a 'interactive plan autopilot'
complete -c copilot -l sync-session -r -f -a 'on off'
complete -c copilot -l ahp-authenticate -r -f -a 'github'
complete -c copilot -n "__fish_copilot_using_subcommand update" -f -a 'stable prerelease'
complete -c copilot -l output -r -f -a 'json'
complete -c copilot -l on-conflict -r -f -a 'skip error'
complete -c copilot -l transport -r -f -a 'stdio http sse'
complete -c copilot -n "__fish_copilot_using_subcommand completion" -f -a 'bash zsh fish'

# Copyright (c) Microsoft Corporation. All rights reserved.
function __copilot_config_context
    set -l tokens (commandline -opc)
    set -e tokens[1]
    argparse -s (__fish_copilot_global_optspecs) -- $tokens 2>/dev/null
    or return 1
    test "$argv[1]" = config; or return 1
end

function __copilot_config_complete
    set -l tokens (commandline -opc)
    set -e tokens[1]
    argparse -s (__fish_copilot_global_optspecs) -- $tokens 2>/dev/null
    or return
    set -l mode read
    set -e argv[1]
    set -l operands
    set -l scope user
    set -l literal 0
    for word in $argv
        if test $literal = 0
            switch $word
                case --repo --local
                    set scope repo
                    continue
                case --global
                    set scope user
                    continue
                case --rm
                    set mode remove
                    continue
                case --list
                    set mode list
                    continue
                case --json
                    continue
                case --
                    set literal 1
                    continue
                case '-*'
                    return
            end
        end
        set -a operands "$word"
    end
    if test $literal = 0; and string match -q -- '-*' (commandline -ct)
        return
    end
    test $mode != list; or return
    switch (count $operands)
        case 0
            if test $mode = read; set scope read; end
            set -l cur (commandline -ct | string unescape)
            for candidate in (__copilot_config_candidates keys $scope '')
                set -l parts (string split '.*.' -- "$candidate")
                if test (count $parts) = 2
                    set -l prefix "$parts[1]."
                    if string match -q -- "$prefix*" "$cur"
                        set -l rest (string replace -- "$prefix" '' "$cur")
                        set -l name (string split -r -m 1 . -- "$rest")
                        test (count $name) = 2; and test -n "$name[1]"; or continue
                        set candidate "$prefix$name[1].$parts[2]"
                    else
                        set candidate "$prefix"
                    end
                end
                printf '%s\n' "$candidate"
            end
        case 1
            if test $mode = read; set mode write; end
            __copilot_config_candidates $mode $scope "$operands[1]"
    end
end

function __copilot_config_candidates
    set -l mode $argv[1]
    set -l scope $argv[2]
    set -l key $argv[3]
    if test "$mode" = keys
        switch "$scope"
            case user
                printf '%s\n' 'ahpEnvironment.acceptRemoteConnections' 'ahpEnvironment.allowCreatingNewSessions' 'ahpEnvironment.computeId' 'ahpEnvironment.name' 'ahpEnvironment.publishNewSessionsByDefault' 'ahpEnvironment.requireConnectionBinding' 'allowedUrls' 'askUser' 'assistedApprovalInstructions' 'autoTier' 'autoUpdate' 'autoUpdatesChannel' 'banner' 'bannerStyle' 'bashEnv' 'beep' 'beepOnSchedule' 'commandHistoryMaxSize' 'compactPaste' 'companyAnnouncements' 'connectors' 'contextManagementTools' 'contextTier' 'continueOnAutoMode' 'copyOnCodeBlockClick' 'copyOnSelect' 'customAgents.defaultLocalOnly' 'defaultMode' 'defaultPermissionMode' 'deniedUrls' 'disableAllHooks' 'disabledHooks' 'disabledMcpServers' 'disabledSkills' 'dynamicRetrieval.mcp' 'dynamicRetrieval.skills' 'editorMode' 'effortLevel' 'enableAllGithubMcpTools' 'enabledMcpServers' 'experimental' 'extensions.disabledExtensions' 'extensions.mode' 'feature_flags.enabled' 'footer.showAgent' 'footer.showAiUsed' 'footer.showBranch' 'footer.showCiStatus' 'footer.showCodeChanges' 'footer.showContextWindow' 'footer.showCustom' 'footer.showDirectory' 'footer.showModelEffort' 'footer.showPullRequest' 'footer.showQuota' 'footer.showSandbox' 'footer.showSchedules' 'footer.showUsername' 'footer.showYolo' 'githubMcpInsiders' 'githubMcpTools' 'githubMcpToolsets' 'ide.autoConnect' 'ide.openDiffOnEdit' 'ignoredSkillsLocations' 'imageGeneration' 'imageGenerationWatermark' 'includeCoAuthoredBy' 'inlineImageLiveWindow' 'inlineImages' 'keepAlive' 'memory' 'mergeStrategy' 'model' 'modelProviderId' 'mouse' 'notifications' 'pinnedPrompts' 'planContextTier' 'planEffortLevel' 'planModel' 'planModelProviderId' 'powershellFlags' 'proxyKerberosServicePrincipal' 'proxyUrl' 'remoteExport' 'renderHexColors' 'renderMarkdown' 'respectGitignore' 'sandbox.addCurrentWorkingDirectory' 'sandbox.allowBypass' 'sandbox.allowDevToolAccess' 'sandbox.auth.gh' 'sandbox.auth.git' 'sandbox.credentials.envVars.*.injectHosts' 'sandbox.enabled' 'sandbox.sandboxLspServers' 'sandbox.sandboxMcpServers' 'sandbox.userPolicy.filesystem.deniedPaths' 'sandbox.userPolicy.filesystem.readonlyPaths' 'sandbox.userPolicy.filesystem.readwritePaths' 'sandbox.userPolicy.network.allowedHosts' 'sandbox.userPolicy.network.allowLocalNetwork' 'sandbox.userPolicy.network.allowOutbound' 'sandbox.userPolicy.network.blockedHosts' 'sandbox.userPolicy.network.proxy.url' 'sandbox.userPolicy.network.proxy.username' 'screenReader' 'scrollbar' 'showReasoning' 'showTimestamps' 'showTipsOnStartup' 'showToolDurations' 'sidebar.accentActiveSession' 'sidebar.coloredHints' 'sidebar.enabled' 'sidebar.hoverFocus' 'sidebar.showCloseButton' 'sidebar.showHeaderButtons' 'sidebar.showResumableSessions' 'skillDirectories' 'statusLine.padding' 'statusLine.refreshInterval' 'statusLine.type' 'stayInAutopilot' 'stream' 'subagents.contextManagementTools' 'subagents.maxConcurrency' 'subagents.maxDepth' 'tabs.enabled' 'tabs.hide' 'tabs.sort' 'taskbarPresence' 'terminalNotifications' 'terminalProgress' 'theme' 'toolSearch' 'transcriptView' 'updateTerminalTitle' 'voice.selectedDevice.name' 'voice.selectedDevice.occurrence' 'workflows.logPhaseNames' 'workflows.maxConcurrentRuns' 'worktreeBaseRef' 'worktreePathTemplate'
            case repo
                printf '%s\n' 'autoTier' 'companyAnnouncements' 'contextTier' 'deniedUrls' 'disableAllHooks' 'disabledMcpServers' 'disabledSkills' 'effortLevel' 'includeCoAuthoredBy' 'mergeStrategy' 'model' 'modelProviderId' 'respectGitignore' 'skillDirectories'
            case read
                printf '%s\n' 'ahpEnvironment.acceptRemoteConnections' 'ahpEnvironment.allowCreatingNewSessions' 'ahpEnvironment.computeId' 'ahpEnvironment.name' 'ahpEnvironment.publishNewSessionsByDefault' 'ahpEnvironment.requireConnectionBinding' 'allowedUrls' 'askUser' 'assistedApprovalInstructions' 'autoTier' 'autoUpdate' 'autoUpdatesChannel' 'banner' 'bannerStyle' 'bashEnv' 'beep' 'beepOnSchedule' 'builtInAgents.rubberDuck' 'builtInAgents.rubberDuckAutoInvoke' 'commandHistoryMaxSize' 'compactPaste' 'companyAnnouncements' 'connectors' 'contextManagementTools' 'contextTier' 'continueOnAutoMode' 'copilotUrl' 'copyOnCodeBlockClick' 'copyOnSelect' 'customAgents.defaultLocalOnly' 'defaultMode' 'defaultPermissionMode' 'deniedUrls' 'disableAllHooks' 'disabledHooks' 'disabledMcpServers' 'disabledSkills' 'dynamicRetrieval.mcp' 'dynamicRetrieval.skills' 'editorMode' 'effortLevel' 'enableAllGithubMcpTools' 'enabledMcpServers' 'experimental' 'extensions.disabledExtensions' 'extensions.mode' 'feature_flags.enabled' 'footer.showAgent' 'footer.showAiUsed' 'footer.showBranch' 'footer.showCiStatus' 'footer.showCodeChanges' 'footer.showContextWindow' 'footer.showCustom' 'footer.showDirectory' 'footer.showModelEffort' 'footer.showPullRequest' 'footer.showQuota' 'footer.showSandbox' 'footer.showSchedules' 'footer.showUsername' 'footer.showYolo' 'githubMcpInsiders' 'githubMcpTools' 'githubMcpToolsets' 'ide.autoConnect' 'ide.openDiffOnEdit' 'ignoredSkillsLocations' 'imageGeneration' 'imageGenerationWatermark' 'includeCoAuthoredBy' 'inlineImageLiveWindow' 'inlineImages' 'keepAlive' 'logLevel' 'memory' 'mergeStrategy' 'model' 'modelProviderId' 'mouse' 'notifications' 'permissions.disableAssistedPermissionsMode' 'permissions.disableBypassPermissionsMode' 'pinnedPrompts' 'planContextTier' 'planEffortLevel' 'planModel' 'planModelProviderId' 'powershellFlags' 'proxyKerberosServicePrincipal' 'proxyUrl' 'remoteExport' 'remoteSessions' 'renderHexColors' 'renderMarkdown' 'respectGitignore' 'sandbox.addCurrentWorkingDirectory' 'sandbox.allowBypass' 'sandbox.allowDevToolAccess' 'sandbox.auth.gh' 'sandbox.auth.git' 'sandbox.credentials.envVars.*.injectHosts' 'sandbox.enabled' 'sandbox.sandboxLspServers' 'sandbox.sandboxMcpServers' 'sandbox.userPolicy.experimental.seatbelt.keychainAccess' 'sandbox.userPolicy.filesystem.deniedPaths' 'sandbox.userPolicy.filesystem.readonlyPaths' 'sandbox.userPolicy.filesystem.readwritePaths' 'sandbox.userPolicy.network.allowedHosts' 'sandbox.userPolicy.network.allowLocalNetwork' 'sandbox.userPolicy.network.allowOutbound' 'sandbox.userPolicy.network.blockedHosts' 'sandbox.userPolicy.network.proxy.password' 'sandbox.userPolicy.network.proxy.url' 'sandbox.userPolicy.network.proxy.username' 'sandbox.userPolicy.seatbelt.keychainAccess' 'screenReader' 'scrollbar' 'shellShortcut' 'showReasoning' 'showTimestamps' 'showTipsOnStartup' 'showToolDurations' 'sidebar.accentActiveSession' 'sidebar.coloredHints' 'sidebar.enabled' 'sidebar.hoverFocus' 'sidebar.showCloseButton' 'sidebar.showHeaderButtons' 'sidebar.showResumableSessions' 'skillDirectories' 'statusLine.command' 'statusLine.padding' 'statusLine.refreshInterval' 'statusLine.type' 'stayInAutopilot' 'storeTokenPlaintext' 'stream' 'streamerMode' 'subagents.contextManagementTools' 'subagents.disabledSubagents' 'subagents.maxConcurrency' 'subagents.maxDepth' 'tabs.enabled' 'tabs.hide' 'tabs.sort' 'taskbarPresence' 'telemetry.capture.identity' 'telemetry.capture.policyDetail' 'telemetry.capture.prompts' 'telemetry.capture.responses' 'telemetry.capture.toolArguments' 'telemetry.capture.toolOutput' 'telemetry.captureContent' 'terminalNotifications' 'terminalProgress' 'theme' 'toolSearch' 'transcriptView' 'updateTerminalTitle' 'voice.enabled' 'voice.selectedDevice.name' 'voice.selectedDevice.occurrence' 'voice.selectedModel' 'workflows.defaultLimits.maxAiCredits' 'workflows.defaultLimits.maxConcurrentSubagents' 'workflows.defaultLimits.maxTotalSubagents' 'workflows.defaultLimits.timeoutSeconds' 'workflows.logPhaseNames' 'workflows.maxConcurrentRuns' 'worktreeBaseRef' 'worktreePathTemplate'
        end
        return
    end
    switch "$scope:$key"
        case 'user:ahpEnvironment.acceptRemoteConnections'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:ahpEnvironment.allowCreatingNewSessions'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:ahpEnvironment.computeId'
            test "$mode" != remove; or return
        case 'user:ahpEnvironment.name'
            test "$mode" != remove; or return
        case 'user:ahpEnvironment.publishNewSessionsByDefault'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:ahpEnvironment.requireConnectionBinding'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:allowedUrls'
        case 'user:askUser'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:assistedApprovalInstructions'
            test "$mode" != remove; or return
        case 'user:autoTier' 'repo:autoTier'
            test "$mode" != remove; or return
            printf '%s\n' 'efficiency' 'balance' 'intelligence'
        case 'user:autoUpdate'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:autoUpdatesChannel'
            test "$mode" != remove; or return
            printf '%s\n' 'stable' 'prerelease'
        case 'user:banner'
            test "$mode" != remove; or return
            printf '%s\n' 'always' 'once' 'never'
        case 'user:bannerStyle'
            test "$mode" != remove; or return
            printf '%s\n' 'mona' 'classic'
        case 'user:bashEnv'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:beep'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:beepOnSchedule'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:commandHistoryMaxSize'
            test "$mode" != remove; or return
        case 'user:compactPaste'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:companyAnnouncements' 'repo:companyAnnouncements'
        case 'user:connectors'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:contextManagementTools'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:contextTier' 'repo:contextTier'
            test "$mode" != remove; or return
            printf '%s\n' 'default' 'long_context'
        case 'user:continueOnAutoMode'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:copyOnCodeBlockClick'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:copyOnSelect'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:customAgents.defaultLocalOnly'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:defaultMode'
            test "$mode" != remove; or return
            printf '%s\n' 'interactive' 'plan' 'autopilot'
        case 'user:defaultPermissionMode'
            test "$mode" != remove; or return
            printf '%s\n' 'manual' 'assisted' 'allow-all'
        case 'user:deniedUrls' 'repo:deniedUrls'
        case 'user:disableAllHooks' 'repo:disableAllHooks'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:disabledHooks'
        case 'user:disabledMcpServers' 'repo:disabledMcpServers'
        case 'user:disabledSkills' 'repo:disabledSkills'
        case 'user:dynamicRetrieval.mcp'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:dynamicRetrieval.skills'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:editorMode'
            test "$mode" != remove; or return
            printf '%s\n' 'normal' 'vim'
        case 'user:effortLevel' 'repo:effortLevel'
            test "$mode" != remove; or return
        case 'user:enableAllGithubMcpTools'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:enabledMcpServers'
        case 'user:experimental'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:extensions.disabledExtensions'
        case 'user:extensions.mode'
            test "$mode" != remove; or return
            printf '%s\n' 'disabled' 'load_only' 'load_and_augment'
        case 'user:feature_flags.enabled'
        case 'user:footer.showAgent'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showAiUsed'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showBranch'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showCiStatus'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showCodeChanges'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showContextWindow'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showCustom'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showDirectory'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showModelEffort'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showPullRequest'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showQuota'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showSandbox'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showSchedules'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showUsername'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:footer.showYolo'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:githubMcpInsiders'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:githubMcpTools'
        case 'user:githubMcpToolsets'
        case 'user:ide.autoConnect'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:ide.openDiffOnEdit'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:ignoredSkillsLocations'
            __fish_complete_directories (commandline -ct)
        case 'user:imageGeneration'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:imageGenerationWatermark'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:includeCoAuthoredBy' 'repo:includeCoAuthoredBy'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:inlineImageLiveWindow'
            test "$mode" != remove; or return
        case 'user:inlineImages'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:keepAlive'
            test "$mode" != remove; or return
            printf '%s\n' 'on' 'off' 'busy'
        case 'user:memory'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:mergeStrategy' 'repo:mergeStrategy'
            test "$mode" != remove; or return
            printf '%s\n' 'rebase' 'merge'
        case 'user:model' 'repo:model'
            test "$mode" != remove; or return
        case 'user:modelProviderId' 'repo:modelProviderId'
            test "$mode" != remove; or return
        case 'user:mouse'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:notifications'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:pinnedPrompts'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:planContextTier'
            test "$mode" != remove; or return
            printf '%s\n' 'default' 'long_context'
        case 'user:planEffortLevel'
            test "$mode" != remove; or return
        case 'user:planModel'
            test "$mode" != remove; or return
        case 'user:planModelProviderId'
            test "$mode" != remove; or return
        case 'user:powershellFlags'
        case 'user:proxyKerberosServicePrincipal'
            test "$mode" != remove; or return
        case 'user:proxyUrl'
            test "$mode" != remove; or return
        case 'user:remoteExport'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:renderHexColors'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:renderMarkdown'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:respectGitignore' 'repo:respectGitignore'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sandbox.addCurrentWorkingDirectory'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sandbox.allowBypass'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sandbox.allowDevToolAccess'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sandbox.auth.gh'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sandbox.auth.git'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sandbox.credentials.envVars.*.injectHosts'
        case 'user:sandbox.enabled'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sandbox.sandboxLspServers'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sandbox.sandboxMcpServers'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sandbox.userPolicy.filesystem.deniedPaths'
            __fish_complete_path (commandline -ct)
        case 'user:sandbox.userPolicy.filesystem.readonlyPaths'
            __fish_complete_path (commandline -ct)
        case 'user:sandbox.userPolicy.filesystem.readwritePaths'
            __fish_complete_path (commandline -ct)
        case 'user:sandbox.userPolicy.network.allowedHosts'
        case 'user:sandbox.userPolicy.network.allowLocalNetwork'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sandbox.userPolicy.network.allowOutbound'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sandbox.userPolicy.network.blockedHosts'
        case 'user:sandbox.userPolicy.network.proxy.url'
            test "$mode" != remove; or return
        case 'user:sandbox.userPolicy.network.proxy.username'
            test "$mode" != remove; or return
        case 'user:screenReader'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:scrollbar'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:showReasoning'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:showTimestamps'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:showTipsOnStartup'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:showToolDurations'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sidebar.accentActiveSession'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sidebar.coloredHints'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sidebar.enabled'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sidebar.hoverFocus'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sidebar.showCloseButton'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sidebar.showHeaderButtons'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:sidebar.showResumableSessions'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:skillDirectories' 'repo:skillDirectories'
            __fish_complete_directories (commandline -ct)
        case 'user:statusLine.padding'
            test "$mode" != remove; or return
        case 'user:statusLine.refreshInterval'
            test "$mode" != remove; or return
        case 'user:statusLine.type'
            test "$mode" != remove; or return
            printf '%s\n' 'command'
        case 'user:stayInAutopilot'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:stream'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:subagents.contextManagementTools'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:subagents.maxConcurrency'
            test "$mode" != remove; or return
        case 'user:subagents.maxDepth'
            test "$mode" != remove; or return
        case 'user:tabs.enabled'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:tabs.hide'
        case 'user:tabs.sort'
        case 'user:taskbarPresence'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:terminalNotifications'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:terminalProgress'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:theme'
            test "$mode" != remove; or return
            printf '%s\n' 'default' 'github' 'dim' 'high-contrast' 'colorblind'
        case 'user:toolSearch'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:transcriptView'
            test "$mode" != remove; or return
            printf '%s\n' 'default' 'concise'
        case 'user:updateTerminalTitle'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:voice.selectedDevice.name'
            test "$mode" != remove; or return
        case 'user:voice.selectedDevice.occurrence'
            test "$mode" != remove; or return
        case 'user:workflows.logPhaseNames'
            test "$mode" != remove; or return
            printf '%s\n' 'true' 'false'
        case 'user:workflows.maxConcurrentRuns'
            test "$mode" != remove; or return
        case 'user:worktreeBaseRef'
            test "$mode" != remove; or return
            printf '%s\n' 'head' 'defaultBranch'
        case 'user:worktreePathTemplate'
            test "$mode" != remove; or return
            __fish_complete_directories (commandline -ct)
    end
end
complete -c copilot -n '__copilot_config_context' -f -a '(__copilot_config_complete)'
