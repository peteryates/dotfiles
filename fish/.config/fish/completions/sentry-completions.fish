# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_sentry_cli_global_optspecs
	string join \n url= header= auth-token= log-level= quiet allow-failure h/help V/version
end

function __fish_sentry_cli_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_sentry_cli_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_sentry_cli_using_subcommand
	set -l cmd (__fish_sentry_cli_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c sentry -n "__fish_sentry_cli_needs_command" -l url -d 'Fully qualified URL to the Sentry server.{n}[default: https://sentry.io/]' -r
complete -c sentry -n "__fish_sentry_cli_needs_command" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_needs_command" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_needs_command" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_needs_command" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_needs_command" -s V -l version -d 'Print version'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "completions" -d 'Generate completions for the specified shell.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "bash-hook" -d 'Prints out a bash script that does error handling.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "build" -d 'Manage builds.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "code-mappings" -d 'Manage code mappings for Sentry. Code mappings link stack trace paths to source code paths in your repository, enabling source context and code linking in Sentry.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "debug-files" -d 'Locate, analyze or upload debug information files.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "dif" -d 'Locate, analyze or upload debug information files.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "deploys" -d 'Manage deployments for Sentry releases.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "events" -d 'Manage events on Sentry.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "info" -d 'Print information about the configuration and verify authentication.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "issues" -d 'Manage issues in Sentry.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "login" -d 'Authenticate with the Sentry server.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "logs" -d '[BETA] Manage logs in Sentry'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "monitors" -d 'Manage cron monitors on Sentry.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "organizations" -d 'Manage organizations on Sentry.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "proguard" -d 'Manage ProGuard mapping files.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "projects" -d 'Manage projects on Sentry.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "react-native" -d 'Upload build artifacts for react-native projects.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "releases" -d 'Manage releases on Sentry.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "repos" -d 'Manage repositories on Sentry.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "send-event" -d 'Send a manual event to Sentry.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "send-envelope" -d 'Send a stored envelope to Sentry.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "snapshots" -d 'Manage and compare snapshots.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "sourcemaps" -d 'Manage sourcemaps for Sentry releases.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "dart-symbol-map" -d 'Manage Dart/Flutter symbol maps for Sentry.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "uninstall" -d 'Uninstall the sentry executable.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "update" -d 'Update the sentry executable.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "upload-dif" -d 'Upload debugging information files.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "upload-dsym" -d 'Upload debugging information files.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "upload-proguard" -d 'Upload ProGuard mapping files to a project.'
complete -c sentry -n "__fish_sentry_cli_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand completions" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand completions" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand completions" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand completions" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand completions" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand completions" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l cli -d 'Explicitly set/override the sentry command' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l traceback -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l tag -d 'Add tags (key:value) to the event.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l release -d 'Define release version for the event.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l log -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l no-exit -d 'Do not turn on -e (exit immediately) flag automatically'
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l no-environ -d 'No-op, as we never send envrionment variables.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l allow-xcode-infoplist-preprocessing -d 'Allow Xcode Info.plist preprocessing with cc. This passes Xcode project settings to the compiler. Do not use with untrusted code!'
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l send-event
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand bash-hook" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and not __fish_seen_subcommand_from download upload snapshots help" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and not __fish_seen_subcommand_from download upload snapshots help" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and not __fish_seen_subcommand_from download upload snapshots help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and not __fish_seen_subcommand_from download upload snapshots help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and not __fish_seen_subcommand_from download upload snapshots help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and not __fish_seen_subcommand_from download upload snapshots help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and not __fish_seen_subcommand_from download upload snapshots help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and not __fish_seen_subcommand_from download upload snapshots help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and not __fish_seen_subcommand_from download upload snapshots help" -f -a "download" -d 'Download a build artifact.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and not __fish_seen_subcommand_from download upload snapshots help" -f -a "upload" -d 'Upload builds to a project.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and not __fish_seen_subcommand_from download upload snapshots help" -f -a "snapshots" -d '[DEPRECATED] Use `sentry snapshots upload` instead.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and not __fish_seen_subcommand_from download upload snapshots help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from download" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from download" -s b -l build-id -d 'The ID of the build to download.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from download" -l output -d 'The output file path. Defaults to \'preprod_artifact_<build_id>.<ext>\' in the current directory, where ext is ipa or apk depending on the platform.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from download" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from download" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from download" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from download" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from download" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from download" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from download" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l head-sha -d 'The VCS commit sha to use for the upload. If not provided, the current commit sha will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l base-sha -d 'The VCS commit\'s base sha to use for the upload. If not provided, the merge-base of the current and remote branch will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l vcs-provider -d 'The VCS provider to use for the upload. If not provided, the current provider will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l head-repo-name -d 'The name of the git repository to use for the upload (e.g. organization/repository). If not provided, the current repository will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l base-repo-name -d 'The name of the git repository to use for the upload (e.g. organization/repository). If not provided, the current repository will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l head-ref -d 'The reference (branch) to use for the upload. If not provided, the current reference will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l base-ref -d 'The base reference (branch) to use for the upload. If not provided, the merge-base with the remote tracking branch will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l pr-number -d 'The pull request number to use for the upload. If not provided and running in a pull_request-triggered GitHub Actions workflow, the PR number will be automatically detected from GitHub Actions environment variables.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l build-configuration -d 'The build configuration to use for the upload. If not provided, the current version will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l release-notes -d 'The release notes to use for the upload.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l install-group -d 'The install group(s) for this build. Can be specified multiple times. Builds with at least one matching install group will be shown updates for each other.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l force-git-metadata -d 'Force collection and sending of git metadata (branch, commit, etc.). If neither this nor --no-git-metadata is specified, git metadata is automatically collected when running in most CI environments.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l no-git-metadata -d 'Disable collection and sending of git metadata.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from upload" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l app-id -d 'The application identifier.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l diff-threshold -d 'If set, Sentry will only report images as changed if their difference % is greater than this value. Example: 0.01 = only report image changes >= 1%.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l all-image-file-names -d 'Comma-separated list of all image names (including subdirectory paths) in the full test suite. Used with selective uploads to detect image removals and renames. Implicitly enables --selective.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l all-image-file-names-file -d 'Path to a file containing all image names (including subdirectory paths), one per line. Used with selective uploads to detect image removals and renames. Implicitly enables --selective.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l head-sha -d 'The VCS commit sha to use for the upload. If not provided, the current commit sha will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l base-sha -d 'The VCS commit\'s base sha to use for the upload. If not provided, the merge-base of the current and remote branch will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l vcs-provider -d 'The VCS provider to use for the upload. If not provided, the current provider will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l head-repo-name -d 'The name of the git repository to use for the upload (e.g. organization/repository). If not provided, the current repository will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l base-repo-name -d 'The name of the git repository to use for the upload (e.g. organization/repository). If not provided, the current repository will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l head-ref -d 'The reference (branch) to use for the upload. If not provided, the current reference will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l base-ref -d 'The base reference (branch) to use for the upload. If not provided, the merge-base with the remote tracking branch will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l pr-number -d 'The pull request number to use for the upload. If not provided and running in a pull_request-triggered GitHub Actions workflow, the PR number will be automatically detected from GitHub Actions environment variables.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l selective -d 'Indicates this upload contains only a subset of images. Removals and renames cannot be detected on PRs.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l force-git-metadata -d 'Force collection and sending of git metadata (branch, commit, etc.). If neither this nor --no-git-metadata is specified, git metadata is automatically collected when running in most CI environments.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l no-git-metadata -d 'Disable collection and sending of git metadata.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from snapshots" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from help" -f -a "download" -d 'Download a build artifact.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from help" -f -a "upload" -d 'Upload builds to a project.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from help" -f -a "snapshots" -d '[DEPRECATED] Use `sentry snapshots upload` instead.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand build; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and not __fish_seen_subcommand_from upload help" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and not __fish_seen_subcommand_from upload help" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and not __fish_seen_subcommand_from upload help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and not __fish_seen_subcommand_from upload help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and not __fish_seen_subcommand_from upload help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and not __fish_seen_subcommand_from upload help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and not __fish_seen_subcommand_from upload help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and not __fish_seen_subcommand_from upload help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and not __fish_seen_subcommand_from upload help" -f -a "upload" -d 'Upload code mappings for a project from a JSON file. Each mapping pairs a stack trace root (e.g. com/example/module) with the corresponding source path in your repository (e.g. modules/module/src/main/java/com/example/module).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and not __fish_seen_subcommand_from upload help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and __fish_seen_subcommand_from upload" -l repo -d 'The repository name (e.g. owner/repo). Defaults to the git remote.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and __fish_seen_subcommand_from upload" -l default-branch -d 'The default branch name. Defaults to the git remote HEAD or \'main\'.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and __fish_seen_subcommand_from upload" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and __fish_seen_subcommand_from upload" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and __fish_seen_subcommand_from upload" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and __fish_seen_subcommand_from upload" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and __fish_seen_subcommand_from upload" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and __fish_seen_subcommand_from upload" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and __fish_seen_subcommand_from upload" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and __fish_seen_subcommand_from upload" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and __fish_seen_subcommand_from help" -f -a "upload" -d 'Upload code mappings for a project from a JSON file. Each mapping pairs a stack trace root (e.g. com/example/module) with the corresponding source path in your repository (e.g. modules/module/src/main/java/com/example/module).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand code-mappings; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "bundle-sources" -d 'Create a source bundle for a given debug information file'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "check" -d 'Check the debug info file at a given path.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "bundle-jvm" -d 'Create a source bundle for the given JVM based source files (e.g. Java, Kotlin, ...)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "find" -d 'Locate debug information files for given debug identifiers.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "print-sources" -d 'Print source files linked by the given debug info file.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "upload" -d 'Upload debugging information files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-sources" -s o -l output -d 'The path to the output folder.  If not provided the file is placed next to the input file.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-sources" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-sources" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-sources" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-sources" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-sources" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-sources" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from check" -s t -l type -d 'Explicitly set the type of the debug info file. This should not be needed as files are auto detected.' -r -f -a "dsym\t''
elf\t''
pe\t''
pdb\t''
portablepdb\t''
sourcebundle\t''
breakpad\t''
proguard\t''
wasm\t''
jvm\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from check" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from check" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from check" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from check" -l json -d 'Format outputs as JSON.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from check" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from check" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from check" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-jvm" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-jvm" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-jvm" -l output -d 'The path to the output folder.' -r -F
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-jvm" -l debug-id -d 'Debug ID (UUID) to use for the source bundle.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-jvm" -l exclude -d 'Glob pattern to exclude files/directories. Can be repeated. By default, common build output and IDE directories are excluded (build, .gradle, target, .idea, .vscode, out, bin, etc.).' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-jvm" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-jvm" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-jvm" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-jvm" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-jvm" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from bundle-jvm" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from find" -s t -l type -d 'Only consider debug information files of the given type.  By default all types are considered.' -r -f -a "dsym\t''
elf\t''
pe\t''
pdb\t''
portablepdb\t''
sourcebundle\t''
breakpad\t''
proguard\t''
wasm\t''
jvm\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from find" -s p -l path -d 'Add a path to search recursively for debug info files.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from find" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from find" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from find" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from find" -l no-well-known -d 'Do not look for debug symbols in well known locations.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from find" -l no-cwd -d 'Do not look for debug symbols in the current working directory.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from find" -l json -d 'Format outputs as JSON.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from find" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from find" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from find" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from print-sources" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from print-sources" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from print-sources" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from print-sources" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from print-sources" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from print-sources" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -s t -l type -d 'Only consider debug information files of the given type.  By default, all types are considered.' -r -f -a "bcsymbolmap\t''
breakpad\t''
dsym\t''
elf\t''
jvm\t''
pdb\t''
pe\t''
portablepdb\t''
sourcebundle\t''
wasm\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l id -d 'Search for specific debug identifiers.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l symbol-maps -d 'Optional path to BCSymbolMap files which are used to resolve hidden symbols in dSYM files downloaded from iTunes Connect.  This requires the dsymutil tool to be available.  This should not be used when using the App Store Connect integration, the .bcsymbolmap files needed for the integration are uploaded without this option if they are found in the PATH searched for symbol files.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l info-plist -d 'This argument is deprecated. It does nothing and will be removed in a future release.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l wait-for -d 'Wait for the server to fully process uploaded files, but at most for the given number of seconds. Errors can only be displayed if --wait or --wait-for is specified, but this will significantly slow down the upload process.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l no-unwind -d 'Do not scan for stack unwinding information. Specify this flag for builds with disabled FPO, or when stackwalking occurs on the device. This usually excludes executables and dynamic libraries. They might still be uploaded, if they contain additional processable information (see other flags).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l no-debug -d 'Do not scan for debugging information. This will usually exclude debug companion files. They might still be uploaded, if they contain additional processable information (see other flags).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l no-sources -d 'Do not scan for source information. This will usually exclude source bundle files. They might still be uploaded, if they contain additional processable information (see other flags).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l require-all -d 'Errors if not all identifiers specified with --id could be found.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l derived-data -d 'Search for debug symbols in Xcode\'s derived data.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l no-zips -d 'Do not search in ZIP files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l no-upload -d 'Disable the actual upload.{n}This runs all steps for the processing but does not trigger the upload.  This is useful if you just want to verify the setup or skip the upload in tests.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l force-foreground -d 'DEPRECATED: Foreground uploads are now the default behavior.{n}This flag has no effect and will be removed in a future version.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l include-sources -d 'Include sources from the local file system and upload them as source bundles.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l wait -d 'Wait for the server to fully process uploaded files. Errors can only be displayed if --wait or --wait-for is specified, but this will significantly slow down the upload process.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l upload-symbol-maps
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l il2cpp-mapping -d 'Compute il2cpp line mappings and upload them along with sources.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from upload" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from help" -f -a "bundle-sources" -d 'Create a source bundle for a given debug information file'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from help" -f -a "check" -d 'Check the debug info file at a given path.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from help" -f -a "bundle-jvm" -d 'Create a source bundle for the given JVM based source files (e.g. Java, Kotlin, ...)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from help" -f -a "find" -d 'Locate debug information files for given debug identifiers.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from help" -f -a "print-sources" -d 'Print source files linked by the given debug info file.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from help" -f -a "upload" -d 'Upload debugging information files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand debug-files; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "bundle-sources" -d 'Create a source bundle for a given debug information file'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "check" -d 'Check the debug info file at a given path.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "bundle-jvm" -d 'Create a source bundle for the given JVM based source files (e.g. Java, Kotlin, ...)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "find" -d 'Locate debug information files for given debug identifiers.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "print-sources" -d 'Print source files linked by the given debug info file.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "upload" -d 'Upload debugging information files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and not __fish_seen_subcommand_from bundle-sources check bundle-jvm find print-sources upload help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-sources" -s o -l output -d 'The path to the output folder.  If not provided the file is placed next to the input file.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-sources" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-sources" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-sources" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-sources" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-sources" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-sources" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from check" -s t -l type -d 'Explicitly set the type of the debug info file. This should not be needed as files are auto detected.' -r -f -a "dsym\t''
elf\t''
pe\t''
pdb\t''
portablepdb\t''
sourcebundle\t''
breakpad\t''
proguard\t''
wasm\t''
jvm\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from check" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from check" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from check" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from check" -l json -d 'Format outputs as JSON.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from check" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from check" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from check" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-jvm" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-jvm" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-jvm" -l output -d 'The path to the output folder.' -r -F
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-jvm" -l debug-id -d 'Debug ID (UUID) to use for the source bundle.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-jvm" -l exclude -d 'Glob pattern to exclude files/directories. Can be repeated. By default, common build output and IDE directories are excluded (build, .gradle, target, .idea, .vscode, out, bin, etc.).' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-jvm" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-jvm" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-jvm" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-jvm" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-jvm" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from bundle-jvm" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from find" -s t -l type -d 'Only consider debug information files of the given type.  By default all types are considered.' -r -f -a "dsym\t''
elf\t''
pe\t''
pdb\t''
portablepdb\t''
sourcebundle\t''
breakpad\t''
proguard\t''
wasm\t''
jvm\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from find" -s p -l path -d 'Add a path to search recursively for debug info files.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from find" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from find" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from find" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from find" -l no-well-known -d 'Do not look for debug symbols in well known locations.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from find" -l no-cwd -d 'Do not look for debug symbols in the current working directory.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from find" -l json -d 'Format outputs as JSON.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from find" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from find" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from find" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from print-sources" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from print-sources" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from print-sources" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from print-sources" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from print-sources" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from print-sources" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -s t -l type -d 'Only consider debug information files of the given type.  By default, all types are considered.' -r -f -a "bcsymbolmap\t''
breakpad\t''
dsym\t''
elf\t''
jvm\t''
pdb\t''
pe\t''
portablepdb\t''
sourcebundle\t''
wasm\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l id -d 'Search for specific debug identifiers.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l symbol-maps -d 'Optional path to BCSymbolMap files which are used to resolve hidden symbols in dSYM files downloaded from iTunes Connect.  This requires the dsymutil tool to be available.  This should not be used when using the App Store Connect integration, the .bcsymbolmap files needed for the integration are uploaded without this option if they are found in the PATH searched for symbol files.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l info-plist -d 'This argument is deprecated. It does nothing and will be removed in a future release.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l wait-for -d 'Wait for the server to fully process uploaded files, but at most for the given number of seconds. Errors can only be displayed if --wait or --wait-for is specified, but this will significantly slow down the upload process.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l no-unwind -d 'Do not scan for stack unwinding information. Specify this flag for builds with disabled FPO, or when stackwalking occurs on the device. This usually excludes executables and dynamic libraries. They might still be uploaded, if they contain additional processable information (see other flags).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l no-debug -d 'Do not scan for debugging information. This will usually exclude debug companion files. They might still be uploaded, if they contain additional processable information (see other flags).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l no-sources -d 'Do not scan for source information. This will usually exclude source bundle files. They might still be uploaded, if they contain additional processable information (see other flags).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l require-all -d 'Errors if not all identifiers specified with --id could be found.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l derived-data -d 'Search for debug symbols in Xcode\'s derived data.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l no-zips -d 'Do not search in ZIP files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l no-upload -d 'Disable the actual upload.{n}This runs all steps for the processing but does not trigger the upload.  This is useful if you just want to verify the setup or skip the upload in tests.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l force-foreground -d 'DEPRECATED: Foreground uploads are now the default behavior.{n}This flag has no effect and will be removed in a future version.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l include-sources -d 'Include sources from the local file system and upload them as source bundles.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l wait -d 'Wait for the server to fully process uploaded files. Errors can only be displayed if --wait or --wait-for is specified, but this will significantly slow down the upload process.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l upload-symbol-maps
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l il2cpp-mapping -d 'Compute il2cpp line mappings and upload them along with sources.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from upload" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from help" -f -a "bundle-sources" -d 'Create a source bundle for a given debug information file'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from help" -f -a "check" -d 'Check the debug info file at a given path.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from help" -f -a "bundle-jvm" -d 'Create a source bundle for the given JVM based source files (e.g. Java, Kotlin, ...)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from help" -f -a "find" -d 'Locate debug information files for given debug identifiers.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from help" -f -a "print-sources" -d 'Print source files linked by the given debug info file.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from help" -f -a "upload" -d 'Upload debugging information files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dif; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and not __fish_seen_subcommand_from list new help" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and not __fish_seen_subcommand_from list new help" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and not __fish_seen_subcommand_from list new help" -s r -l release -d 'The release slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and not __fish_seen_subcommand_from list new help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and not __fish_seen_subcommand_from list new help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and not __fish_seen_subcommand_from list new help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and not __fish_seen_subcommand_from list new help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and not __fish_seen_subcommand_from list new help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and not __fish_seen_subcommand_from list new help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and not __fish_seen_subcommand_from list new help" -f -a "list" -d 'List all deployments of a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and not __fish_seen_subcommand_from list new help" -f -a "new" -d 'Creates a new release deployment.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and not __fish_seen_subcommand_from list new help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from list" -l version -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from list" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from list" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from list" -s r -l release -d 'The release slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from list" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from list" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from list" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from list" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from list" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -l version -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -s e -l env -d 'Set the environment for this release.{n}This argument is required.  Values that make sense here would be \'production\' or \'staging\'.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -s n -l name -d 'Optional human readable name for this deployment.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -s u -l url -d 'Optional URL that points to the deployment.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -l started -d 'Optional unix timestamp when the deployment started.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -l finished -d 'Optional unix timestamp when the deployment finished.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -s t -l time -d 'Optional deployment duration in seconds.{n}This can be specified alternatively to `--started` and `--finished`.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -s r -l release -d 'The release slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from new" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all deployments of a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from help" -f -a "new" -d 'Creates a new release deployment.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand deploys; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and not __fish_seen_subcommand_from list help" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and not __fish_seen_subcommand_from list help" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and not __fish_seen_subcommand_from list help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and not __fish_seen_subcommand_from list help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and not __fish_seen_subcommand_from list help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and not __fish_seen_subcommand_from list help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and not __fish_seen_subcommand_from list help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and not __fish_seen_subcommand_from list help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and not __fish_seen_subcommand_from list help" -f -a "list" -d 'List all events in your organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and not __fish_seen_subcommand_from list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from list" -l max-rows -d 'Maximum number of rows to print.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from list" -l pages -d 'Maximum number of pages to fetch (100 events/page).' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from list" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from list" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from list" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from list" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from list" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from list" -s U -l show-user -d 'Display the Users column.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from list" -s T -l show-tags -d 'Display the Tags column.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from list" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from list" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all events in your organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand events; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand info" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand info" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand info" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand info" -l config-status-json -d 'Return the status of the config that sentry loads as JSON dump. This can be used by external tools to aid the user towards configuration.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand info" -l no-defaults -d 'Skip default organization and project checks. This allows you to verify your authentication method, without the need for setting other defaults.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand info" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand info" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand info" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -s s -l status -d 'Select all issues matching a given status.' -r -f -a "resolved\t''
muted\t''
unresolved\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -s i -l id -d 'Select the issue with the given ID.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -s a -l all -d 'Select all issues (this might be limited).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -f -a "list" -d 'List all issues in your organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -f -a "mute" -d 'Bulk mute all selected issues.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -f -a "resolve" -d 'Bulk resolve all selected issues.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -f -a "unresolve" -d 'Bulk unresolve all selected issues.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and not __fish_seen_subcommand_from list mute resolve unresolve help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -l max-rows -d 'Maximum number of rows to print.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -l pages -d 'Maximum number of pages to fetch (100 issues/page).' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -l query -d 'Query to filter issues. Example: "is:unresolved". If omitted, no filtering is applied. See https://docs.sentry.io/concepts/search/ for syntax.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -s s -l status -d 'Select all issues matching a given status.' -r -f -a "resolved\t''
muted\t''
unresolved\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -s i -l id -d 'Select the issue with the given ID.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -s a -l all -d 'Select all issues (this might be limited).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from mute" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from mute" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from mute" -s s -l status -d 'Select all issues matching a given status.' -r -f -a "resolved\t''
muted\t''
unresolved\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from mute" -s i -l id -d 'Select the issue with the given ID.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from mute" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from mute" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from mute" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from mute" -s a -l all -d 'Select all issues (this might be limited).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from mute" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from mute" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from mute" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from resolve" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from resolve" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from resolve" -s s -l status -d 'Select all issues matching a given status.' -r -f -a "resolved\t''
muted\t''
unresolved\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from resolve" -s i -l id -d 'Select the issue with the given ID.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from resolve" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from resolve" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from resolve" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from resolve" -s n -l next-release -d 'Only select issues in the next release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from resolve" -s a -l all -d 'Select all issues (this might be limited).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from resolve" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from resolve" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from resolve" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from unresolve" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from unresolve" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from unresolve" -s s -l status -d 'Select all issues matching a given status.' -r -f -a "resolved\t''
muted\t''
unresolved\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from unresolve" -s i -l id -d 'Select the issue with the given ID.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from unresolve" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from unresolve" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from unresolve" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from unresolve" -s a -l all -d 'Select all issues (this might be limited).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from unresolve" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from unresolve" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from unresolve" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all issues in your organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from help" -f -a "mute" -d 'Bulk mute all selected issues.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from help" -f -a "resolve" -d 'Bulk resolve all selected issues.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from help" -f -a "unresolve" -d 'Bulk unresolve all selected issues.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand issues; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand login" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand login" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand login" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand login" -s g -l global -d 'Store authentication token globally rather than locally.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand login" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand login" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand login" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and not __fish_seen_subcommand_from list help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and not __fish_seen_subcommand_from list help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and not __fish_seen_subcommand_from list help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and not __fish_seen_subcommand_from list help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and not __fish_seen_subcommand_from list help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and not __fish_seen_subcommand_from list help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and not __fish_seen_subcommand_from list help" -f -a "list" -d '[BETA] List logs from your organization'
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and not __fish_seen_subcommand_from list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from list" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from list" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from list" -l max-rows -d 'Maximum number of log entries to fetch and display (max 1000).' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from list" -l query -d 'Query to filter logs. Example: "level:error". If omitted, no filtering is applied. See https://docs.sentry.io/concepts/search/ for syntax.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from list" -l poll-interval -d 'Poll interval in seconds (must be > 0). Only used when --live is specified.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from list" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from list" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from list" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from list" -l live -d 'Live stream logs.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from list" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from list" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "list" -d '[BETA] List logs from your organization'
complete -c sentry -n "__fish_sentry_cli_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and not __fish_seen_subcommand_from list run help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and not __fish_seen_subcommand_from list run help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and not __fish_seen_subcommand_from list run help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and not __fish_seen_subcommand_from list run help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and not __fish_seen_subcommand_from list run help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and not __fish_seen_subcommand_from list run help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and not __fish_seen_subcommand_from list run help" -f -a "list" -d 'List all monitors for an organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and not __fish_seen_subcommand_from list run help" -f -a "run" -d 'Wraps a command'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and not __fish_seen_subcommand_from list run help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from list" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from list" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from list" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from list" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from list" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from list" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -s e -l environment -d 'Specify the environment of the monitor.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -s s -l schedule -d 'Configure the cron monitor with the given schedule (crontab format). Enclose the schedule in quotes to ensure your command line environment parses the argument correctly.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -l check-in-margin -d 'The allowed margin of minutes after the expected check-in time that the monitor will not be considered missed for. Requires --schedule.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -l max-runtime -d 'The allowed duration in minutes that the monitor may be in progress for before being considered failed due to timeout. Requires --schedule.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -l timezone -d 'A tz database string (e.g. "Europe/Vienna") representing the monitor\'s execution schedule\'s timezone. Requires --schedule.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -l failure-issue-threshold -d 'The number of consecutive missed or error check-ins that trigger an issue. Requires --schedule.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -l recovery-threshold -d 'The number of consecutive successful check-ins that resolve an issue. Requires --schedule.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -l auth-token -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from run" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all monitors for an organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from help" -f -a "run" -d 'Wraps a command'
complete -c sentry -n "__fish_sentry_cli_using_subcommand monitors; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and not __fish_seen_subcommand_from list help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and not __fish_seen_subcommand_from list help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and not __fish_seen_subcommand_from list help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and not __fish_seen_subcommand_from list help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and not __fish_seen_subcommand_from list help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and not __fish_seen_subcommand_from list help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and not __fish_seen_subcommand_from list help" -f -a "list" -d 'List all organizations available to the authenticated token.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and not __fish_seen_subcommand_from list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and __fish_seen_subcommand_from list" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and __fish_seen_subcommand_from list" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and __fish_seen_subcommand_from list" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and __fish_seen_subcommand_from list" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and __fish_seen_subcommand_from list" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all organizations available to the authenticated token.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand organizations; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and not __fish_seen_subcommand_from upload uuid help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and not __fish_seen_subcommand_from upload uuid help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and not __fish_seen_subcommand_from upload uuid help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and not __fish_seen_subcommand_from upload uuid help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and not __fish_seen_subcommand_from upload uuid help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and not __fish_seen_subcommand_from upload uuid help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and not __fish_seen_subcommand_from upload uuid help" -f -a "upload" -d 'Upload ProGuard mapping files to a project.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and not __fish_seen_subcommand_from upload uuid help" -f -a "uuid" -d 'Compute the UUID for a ProGuard mapping file.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and not __fish_seen_subcommand_from upload uuid help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from upload" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from upload" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from upload" -l write-properties -d 'Write the UUIDs for the processed mapping files into the given properties file.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from upload" -s u -l uuid -d '[DEPRECATED] Manually override the UUID for the uploaded mapping. We no longer recommend using this option. If you use this option, you must use it consistently, and you must ensure the UUID is generated deterministically based on the ProGuard mapping.  If you need to know the UUID before upload, we recommend using the `proguard uuid` command.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from upload" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from upload" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from upload" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from upload" -l no-upload -d 'Disable the actual upload.{n}This runs all steps for the processing but does not trigger the upload.  This is useful if you just want to verify the mapping files and write the proguard UUIDs into a properties file.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from upload" -l require-one -d 'Requires at least one file to upload or the command will error.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from upload" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from upload" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from upload" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from uuid" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from uuid" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from uuid" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from uuid" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from uuid" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from uuid" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from help" -f -a "upload" -d 'Upload ProGuard mapping files to a project.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from help" -f -a "uuid" -d 'Compute the UUID for a ProGuard mapping file.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand proguard; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and not __fish_seen_subcommand_from list help" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and not __fish_seen_subcommand_from list help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and not __fish_seen_subcommand_from list help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and not __fish_seen_subcommand_from list help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and not __fish_seen_subcommand_from list help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and not __fish_seen_subcommand_from list help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and not __fish_seen_subcommand_from list help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and not __fish_seen_subcommand_from list help" -f -a "list" -d 'List all projects for an organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and not __fish_seen_subcommand_from list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and __fish_seen_subcommand_from list" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and __fish_seen_subcommand_from list" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and __fish_seen_subcommand_from list" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and __fish_seen_subcommand_from list" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and __fish_seen_subcommand_from list" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and __fish_seen_subcommand_from list" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all projects for an organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand projects; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and not __fish_seen_subcommand_from gradle help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and not __fish_seen_subcommand_from gradle help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and not __fish_seen_subcommand_from gradle help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and not __fish_seen_subcommand_from gradle help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and not __fish_seen_subcommand_from gradle help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and not __fish_seen_subcommand_from gradle help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and not __fish_seen_subcommand_from gradle help" -f -a "gradle" -d 'Upload react-native projects in a gradle build step.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and not __fish_seen_subcommand_from gradle help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -l sourcemap -d 'The path to a sourcemap that should be uploaded.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -l bundle -d 'The path to a bundle that should be uploaded.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -l release -d 'The name of the release to publish.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -l dist -d 'The names of the distributions to publish. Can be supplied multiple times.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -l wait-for -d 'Wait for the server to fully process uploaded files, but at most for the given number of seconds.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -l wait -d 'Wait for the server to fully process uploaded files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from gradle" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from help" -f -a "gradle" -d 'Upload react-native projects in a gradle build step.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand react-native; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -f -a "deploys" -d 'Manage deployments for Sentry releases.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -f -a "archive" -d 'Archive a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -f -a "delete" -d 'Delete a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -f -a "finalize" -d 'Mark a release as finalized and released.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -f -a "info" -d 'Print information about a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -f -a "list" -d 'List the most recent releases.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -f -a "new" -d 'Create a new release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -f -a "propose-version" -d 'Propose a version name for a new release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -f -a "restore" -d 'Restore a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -f -a "set-commits" -d 'Set commits of a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and not __fish_seen_subcommand_from deploys archive delete finalize info list new propose-version restore set-commits help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from deploys" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from deploys" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from deploys" -s r -l release -d 'The release slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from deploys" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from deploys" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from deploys" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from deploys" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from deploys" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from deploys" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from deploys" -a "list" -d 'List all deployments of a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from deploys" -a "new" -d 'Creates a new release deployment.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from deploys" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from archive" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from archive" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from archive" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from archive" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from archive" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from archive" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from archive" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from archive" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from delete" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from delete" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from delete" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from delete" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from delete" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from delete" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from delete" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from finalize" -l url -d 'Optional URL to the release for information purposes.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from finalize" -l released -d 'Set the release time. [defaults to the current time]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from finalize" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from finalize" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from finalize" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from finalize" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from finalize" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from finalize" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from finalize" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from finalize" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from info" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from info" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from info" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from info" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from info" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from info" -s P -l show-projects -d 'Display the Projects column'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from info" -s C -l show-commits -d 'Display the Commits column'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from info" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from info" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from list" -s D -l delimiter -d 'Delimiter for the --raw flag' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from list" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from list" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from list" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from list" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from list" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from list" -s P -l show-projects -d 'Display the Projects column'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from list" -s R -l raw -d 'Print raw, delimiter separated list of releases. [defaults to new line]'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from list" -l no-abbrev
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from list" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from list" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from new" -l url -d 'Optional URL to the release for information purposes.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from new" -l ref -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from new" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from new" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from new" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from new" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from new" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from new" -l finalize -d 'Immediately finalize the release. (sets it to released)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from new" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from new" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from new" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from propose-version" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from propose-version" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from propose-version" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from propose-version" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from propose-version" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from propose-version" -l allow-xcode-infoplist-preprocessing -d 'Allow Xcode Info.plist preprocessing with cc. This passes Xcode project settings to the compiler. Do not use with untrusted code!'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from propose-version" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from propose-version" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from propose-version" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from restore" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from restore" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from restore" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from restore" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from restore" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from restore" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from restore" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from restore" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -l initial-depth -d 'Set the number of commits of the initial release. The default is 20.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -s c -l commit -d 'Defines a single commit for a repo as identified by the repo name in the remote Sentry config. The value must be provided as `REPO@SHA` where SHA is at most 64 characters. To specify a range, use `REPO@PREV_SHA..SHA` format.  Note: You must specify a previous commit when setting commits for the first release.  Examples:   - `my-repo@abc123` (partial SHA)   - `my-repo@62aaca3ed186edc7671b4cca0ab6ec53cb7de8b5` (full SHA)   - `my-repo@abc123..def456` (commit range)' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -l clear -d 'Clear all current commits from the release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -l auto -d 'Enable completely automated commit management.{n}This requires that the command is run from within a git repository.  sentry will then automatically find remotely configured repositories and discover commits.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -l ignore-missing -d 'When the flag is set and the previous release commit was not found in the repository, will create a release with the default commits count (or the one specified with `--initial-depth`) instead of failing the command.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -l local -d 'Set commits of a release from local git.{n}This requires that the command is run from within a git repository.  sentry will then automatically find remotely configured repositories and discover commits.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -l ignore-empty
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from set-commits" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from help" -f -a "deploys" -d 'Manage deployments for Sentry releases.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from help" -f -a "archive" -d 'Archive a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from help" -f -a "finalize" -d 'Mark a release as finalized and released.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from help" -f -a "info" -d 'Print information about a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from help" -f -a "list" -d 'List the most recent releases.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from help" -f -a "new" -d 'Create a new release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from help" -f -a "propose-version" -d 'Propose a version name for a new release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from help" -f -a "restore" -d 'Restore a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from help" -f -a "set-commits" -d 'Set commits of a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand releases; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and not __fish_seen_subcommand_from list help" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and not __fish_seen_subcommand_from list help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and not __fish_seen_subcommand_from list help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and not __fish_seen_subcommand_from list help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and not __fish_seen_subcommand_from list help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and not __fish_seen_subcommand_from list help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and not __fish_seen_subcommand_from list help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and not __fish_seen_subcommand_from list help" -f -a "list" -d 'List all repositories in your organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and not __fish_seen_subcommand_from list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and __fish_seen_subcommand_from list" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and __fish_seen_subcommand_from list" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and __fish_seen_subcommand_from list" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and __fish_seen_subcommand_from list" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and __fish_seen_subcommand_from list" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and __fish_seen_subcommand_from list" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all repositories in your organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand repos; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -s l -l level -d 'Optional event severity/log level. (debug|info|warning|error|fatal) [defaults to \'error\']' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -l timestamp -d 'Optional event timestamp in one of supported formats: unix timestamp, RFC2822 or RFC3339.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -s r -l release -d 'Optional identifier of the release.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -s d -l dist -d 'Set the distribution.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -s E -l env -d 'Send with a specific environment.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -s m -l message -d 'The event message.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -s a -l message-arg -d 'Arguments for the event message.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -s p -l platform -d 'Override the default \'other\' platform specifier.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -s t -l tag -d 'Add a tag (key:value) to the event.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -s e -l extra -d 'Add extra information (key:value) to the event.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -s u -l user -d 'Add user information (key:value) to the event. [eg: id:42, username:foo]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -s f -l fingerprint -d 'Change the fingerprint of the event.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -l logfile -d 'Send a logfile as breadcrumbs with the event (last 100 records)' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -l raw -d 'Send events using an envelope without attempting to parse their contents.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -l no-environ -d 'Do not send environment variables along'
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -l allow-xcode-infoplist-preprocessing -d 'Allow Xcode Info.plist preprocessing with cc. This passes Xcode project settings to the compiler. Do not use with untrusted code!'
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -l with-categories -d 'Parses off a leading category for breadcrumbs from the logfile'
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-event" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-envelope" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-envelope" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-envelope" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-envelope" -l raw -d 'Send envelopes without attempting to parse their contents.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-envelope" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-envelope" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand send-envelope" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and not __fish_seen_subcommand_from diff download upload help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and not __fish_seen_subcommand_from diff download upload help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and not __fish_seen_subcommand_from diff download upload help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and not __fish_seen_subcommand_from diff download upload help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and not __fish_seen_subcommand_from diff download upload help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and not __fish_seen_subcommand_from diff download upload help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and not __fish_seen_subcommand_from diff download upload help" -f -a "diff" -d 'Compare two directories of snapshot images locally using odiff.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and not __fish_seen_subcommand_from diff download upload help" -f -a "download" -d 'Download baseline snapshot images from Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and not __fish_seen_subcommand_from diff download upload help" -f -a "upload" -d 'Upload snapshots to a project.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and not __fish_seen_subcommand_from diff download upload help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from diff" -s o -l output -d 'Directory for diff mask images.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from diff" -l threshold -d 'Pixel color difference threshold (0.0-1.0).' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from diff" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from diff" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from diff" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from diff" -l no-antialiasing -d 'Disable antialiasing detection.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from diff" -l fail-on-diff -d 'Exit with code 1 if any diffs are found.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from diff" -l selective -d 'Treat missing base images as skipped instead of removed.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from diff" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from diff" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from diff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from download" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from download" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from download" -l app-id -d 'App identifier (e.g. sentry-frontend). Mutually exclusive with --snapshot-id.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from download" -l snapshot-id -d 'Direct snapshot artifact ID. Mutually exclusive with --app-id.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from download" -l branch -d 'Git branch filter (only with --app-id).' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from download" -l output -d 'Directory for extracted images.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from download" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from download" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from download" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from download" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from download" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from download" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l app-id -d 'The application identifier.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l diff-threshold -d 'If set, Sentry will only report images as changed if their difference % is greater than this value. Example: 0.01 = only report image changes >= 1%.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l all-image-file-names -d 'Comma-separated list of all image names (including subdirectory paths) in the full test suite. Used with selective uploads to detect image removals and renames. Implicitly enables --selective.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l all-image-file-names-file -d 'Path to a file containing all image names (including subdirectory paths), one per line. Used with selective uploads to detect image removals and renames. Implicitly enables --selective.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l head-sha -d 'The VCS commit sha to use for the upload. If not provided, the current commit sha will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l base-sha -d 'The VCS commit\'s base sha to use for the upload. If not provided, the merge-base of the current and remote branch will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l vcs-provider -d 'The VCS provider to use for the upload. If not provided, the current provider will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l head-repo-name -d 'The name of the git repository to use for the upload (e.g. organization/repository). If not provided, the current repository will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l base-repo-name -d 'The name of the git repository to use for the upload (e.g. organization/repository). If not provided, the current repository will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l head-ref -d 'The reference (branch) to use for the upload. If not provided, the current reference will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l base-ref -d 'The base reference (branch) to use for the upload. If not provided, the merge-base with the remote tracking branch will be used.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l pr-number -d 'The pull request number to use for the upload. If not provided and running in a pull_request-triggered GitHub Actions workflow, the PR number will be automatically detected from GitHub Actions environment variables.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l selective -d 'Indicates this upload contains only a subset of images. Removals and renames cannot be detected on PRs.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l force-git-metadata -d 'Force collection and sending of git metadata (branch, commit, etc.). If neither this nor --no-git-metadata is specified, git metadata is automatically collected when running in most CI environments.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l no-git-metadata -d 'Disable collection and sending of git metadata.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from upload" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from help" -f -a "diff" -d 'Compare two directories of snapshot images locally using odiff.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from help" -f -a "download" -d 'Download baseline snapshot images from Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from help" -f -a "upload" -d 'Upload snapshots to a project.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand snapshots; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -s r -l release -d 'The release slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -f -a "inject" -d 'Fixes up JavaScript source files and sourcemaps with debug ids.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -f -a "resolve" -d 'Resolve sourcemap for a given line/column position.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -f -a "upload" -d 'Upload sourcemaps for a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and not __fish_seen_subcommand_from inject resolve upload help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -s i -l ignore -d 'Ignores all files and folders matching the given glob' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -s I -l ignore-file -d 'Ignore all files and folders specified in the given ignore file, e.g. .gitignore.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -s x -l ext -d 'Set the file extensions of JavaScript files that are considered for injection.  This overrides the default extensions (js, cjs, mjs).  To add an extension, all default extensions must be repeated.  Specify once per extension.  Source maps are discovered via those files.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -s r -l release -d 'The release slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -l dry-run -d 'Don\'t modify files on disk.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from inject" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from resolve" -s l -l line -d 'Line number for minified source.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from resolve" -s c -l column -d 'Column number for minified source.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from resolve" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from resolve" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from resolve" -s r -l release -d 'The release slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from resolve" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from resolve" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from resolve" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from resolve" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from resolve" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from resolve" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l version -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -s u -l url-prefix -d 'The URL prefix to prepend to all filenames.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l url-suffix -d 'The URL suffix to append to all filenames.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -s d -l dist -d 'Optional distribution identifier for the sourcemaps.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l note -d 'Adds an optional note to the uploaded artifact bundle.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l wait-for -d 'Wait for the server to fully process uploaded files, but at most for the given number of seconds.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l strip-prefix -d 'Strips the given prefix from all sources references inside the upload sourcemaps (paths used within the sourcemap content, to map minified code to it\'s original source). Only sources that start with the given prefix will be stripped.{n}This will not modify the uploaded sources paths. To do that, point the upload or upload-sourcemaps command to a more precise directory instead.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -s i -l ignore -d 'Ignores all files and folders matching the given glob' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -s I -l ignore-file -d 'Ignore all files and folders specified in the given ignore file, e.g. .gitignore.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l bundle -d 'Path to the application bundle (indexed, file, or regular)' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l bundle-sourcemap -d 'Path to the bundle sourcemap' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -s x -l ext -d 'Set the file extensions that are considered for upload. This overrides the default extensions. To add an extension, all default extensions must be repeated. Specify once per extension. Defaults to: `--ext=js --ext=cjs --ext=mjs --ext=map --ext=jsbundle --ext=bundle`' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -s r -l release -d 'The release slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l validate -d 'Enable basic sourcemap validation.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l decompress -d 'Enable files gzip decompression prior to upload.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l wait -d 'Wait for the server to fully process uploaded files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l no-sourcemap-reference -d 'Disable emitting of automatic sourcemap references.{n}By default the tool will store a \'Sourcemap\' header with minified files so that sourcemaps are located automatically if the tool can detect a link. If this causes issues it can be disabled.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l debug-id-reference -d 'Enable emitting of automatic debug id references.{n}By default Debug ID reference has to be present both in the source and the related sourcemap. But in cases of binary bundles, the tool can\'t verify presence of the Debug ID. This flag allows use of Debug ID from the linked sourcemap.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l no-rewrite -d 'Disables rewriting of matching sourcemaps. By default the tool will rewrite sources, so that indexed maps are flattened and missing sources are inlined if possible.{n}This fundamentally changes the upload process to be based on sourcemaps and minified files exclusively and comes in handy for setups like react-native that generate sourcemaps that would otherwise not work for sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l strip-common-prefix -d 'Similar to --strip-prefix but strips the most common prefix on all sources references.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l no-dedupe -d '[DEPRECATED] This flag has no effect and is scheduled for removal.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -s s -l strict -d 'Fail with a non-zero exit code if the specified source map file cannot be uploaded.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l rewrite
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -s v -l verbose
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from upload" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from help" -f -a "inject" -d 'Fixes up JavaScript source files and sourcemaps with debug ids.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from help" -f -a "resolve" -d 'Resolve sourcemap for a given line/column position.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from help" -f -a "upload" -d 'Upload sourcemaps for a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand sourcemaps; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and not __fish_seen_subcommand_from upload help" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and not __fish_seen_subcommand_from upload help" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and not __fish_seen_subcommand_from upload help" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and not __fish_seen_subcommand_from upload help" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and not __fish_seen_subcommand_from upload help" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and not __fish_seen_subcommand_from upload help" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and not __fish_seen_subcommand_from upload help" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and not __fish_seen_subcommand_from upload help" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and not __fish_seen_subcommand_from upload help" -f -a "upload" -d 'Upload a Dart/Flutter symbol map (dartsymbolmap) for deobfuscating Dart exception types.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and not __fish_seen_subcommand_from upload help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and __fish_seen_subcommand_from upload" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and __fish_seen_subcommand_from upload" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and __fish_seen_subcommand_from upload" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and __fish_seen_subcommand_from upload" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and __fish_seen_subcommand_from upload" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and __fish_seen_subcommand_from upload" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and __fish_seen_subcommand_from upload" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and __fish_seen_subcommand_from upload" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and __fish_seen_subcommand_from help" -f -a "upload" -d 'Upload a Dart/Flutter symbol map (dartsymbolmap) for deobfuscating Dart exception types.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand dart-symbol-map; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand uninstall" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand uninstall" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand uninstall" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand uninstall" -l confirm -d 'Skip uninstall confirmation prompt.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand uninstall" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand uninstall" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand uninstall" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand update" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand update" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand update" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand update" -s f -l force -d 'Force the update even if the latest version is already installed.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand update" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand update" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand update" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -s t -l type -d 'Only consider debug information files of the given type.  By default, all types are considered.' -r -f -a "bcsymbolmap\t''
breakpad\t''
dsym\t''
elf\t''
jvm\t''
pdb\t''
pe\t''
portablepdb\t''
sourcebundle\t''
wasm\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l id -d 'Search for specific debug identifiers.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l symbol-maps -d 'Optional path to BCSymbolMap files which are used to resolve hidden symbols in dSYM files downloaded from iTunes Connect.  This requires the dsymutil tool to be available.  This should not be used when using the App Store Connect integration, the .bcsymbolmap files needed for the integration are uploaded without this option if they are found in the PATH searched for symbol files.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l info-plist -d 'This argument is deprecated. It does nothing and will be removed in a future release.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l wait-for -d 'Wait for the server to fully process uploaded files, but at most for the given number of seconds. Errors can only be displayed if --wait or --wait-for is specified, but this will significantly slow down the upload process.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l no-unwind -d 'Do not scan for stack unwinding information. Specify this flag for builds with disabled FPO, or when stackwalking occurs on the device. This usually excludes executables and dynamic libraries. They might still be uploaded, if they contain additional processable information (see other flags).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l no-debug -d 'Do not scan for debugging information. This will usually exclude debug companion files. They might still be uploaded, if they contain additional processable information (see other flags).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l no-sources -d 'Do not scan for source information. This will usually exclude source bundle files. They might still be uploaded, if they contain additional processable information (see other flags).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l require-all -d 'Errors if not all identifiers specified with --id could be found.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l derived-data -d 'Search for debug symbols in Xcode\'s derived data.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l no-zips -d 'Do not search in ZIP files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l no-upload -d 'Disable the actual upload.{n}This runs all steps for the processing but does not trigger the upload.  This is useful if you just want to verify the setup or skip the upload in tests.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l force-foreground -d 'DEPRECATED: Foreground uploads are now the default behavior.{n}This flag has no effect and will be removed in a future version.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l include-sources -d 'Include sources from the local file system and upload them as source bundles.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l wait -d 'Wait for the server to fully process uploaded files. Errors can only be displayed if --wait or --wait-for is specified, but this will significantly slow down the upload process.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l upload-symbol-maps
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l il2cpp-mapping -d 'Compute il2cpp line mappings and upload them along with sources.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dif" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -s t -l type -d 'Only consider debug information files of the given type.  By default, all types are considered.' -r -f -a "bcsymbolmap\t''
breakpad\t''
dsym\t''
elf\t''
jvm\t''
pdb\t''
pe\t''
portablepdb\t''
sourcebundle\t''
wasm\t''"
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l id -d 'Search for specific debug identifiers.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l symbol-maps -d 'Optional path to BCSymbolMap files which are used to resolve hidden symbols in dSYM files downloaded from iTunes Connect.  This requires the dsymutil tool to be available.  This should not be used when using the App Store Connect integration, the .bcsymbolmap files needed for the integration are uploaded without this option if they are found in the PATH searched for symbol files.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l info-plist -d 'This argument is deprecated. It does nothing and will be removed in a future release.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l wait-for -d 'Wait for the server to fully process uploaded files, but at most for the given number of seconds. Errors can only be displayed if --wait or --wait-for is specified, but this will significantly slow down the upload process.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l no-unwind -d 'Do not scan for stack unwinding information. Specify this flag for builds with disabled FPO, or when stackwalking occurs on the device. This usually excludes executables and dynamic libraries. They might still be uploaded, if they contain additional processable information (see other flags).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l no-debug -d 'Do not scan for debugging information. This will usually exclude debug companion files. They might still be uploaded, if they contain additional processable information (see other flags).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l no-sources -d 'Do not scan for source information. This will usually exclude source bundle files. They might still be uploaded, if they contain additional processable information (see other flags).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l require-all -d 'Errors if not all identifiers specified with --id could be found.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l derived-data -d 'Search for debug symbols in Xcode\'s derived data.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l no-zips -d 'Do not search in ZIP files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l no-upload -d 'Disable the actual upload.{n}This runs all steps for the processing but does not trigger the upload.  This is useful if you just want to verify the setup or skip the upload in tests.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l force-foreground -d 'DEPRECATED: Foreground uploads are now the default behavior.{n}This flag has no effect and will be removed in a future version.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l include-sources -d 'Include sources from the local file system and upload them as source bundles.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l wait -d 'Wait for the server to fully process uploaded files. Errors can only be displayed if --wait or --wait-for is specified, but this will significantly slow down the upload process.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l upload-symbol-maps
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l il2cpp-mapping -d 'Compute il2cpp line mappings and upload them along with sources.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-dsym" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-proguard" -s o -l org -d 'The organization ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-proguard" -s p -l project -d 'The project ID or slug.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-proguard" -l write-properties -d 'Write the UUIDs for the processed mapping files into the given properties file.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-proguard" -s u -l uuid -d '[DEPRECATED] Manually override the UUID for the uploaded mapping. We no longer recommend using this option. If you use this option, you must use it consistently, and you must ensure the UUID is generated deterministically based on the ProGuard mapping.  If you need to know the UUID before upload, we recommend using the `proguard uuid` command.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-proguard" -l header -d 'Custom headers that should be attached to all requests{n}in key:value format.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-proguard" -l auth-token -d 'Use the given Sentry auth token.' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-proguard" -l log-level -d 'Set the log output verbosity. [possible values: trace, debug, info, warn, error]' -r
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-proguard" -l no-upload -d 'Disable the actual upload.{n}This runs all steps for the processing but does not trigger the upload.  This is useful if you just want to verify the mapping files and write the proguard UUIDs into a properties file.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-proguard" -l require-one -d 'Requires at least one file to upload or the command will error.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-proguard" -l quiet -l silent -d 'Do not print any output while preserving correct exit code. This flag is currently implemented only for selected subcommands.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-proguard" -l allow-failure -d 'Always return 0 exit code.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand upload-proguard" -s h -l help -d 'Print help'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "completions" -d 'Generate completions for the specified shell.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "bash-hook" -d 'Prints out a bash script that does error handling.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "build" -d 'Manage builds.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "code-mappings" -d 'Manage code mappings for Sentry. Code mappings link stack trace paths to source code paths in your repository, enabling source context and code linking in Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "debug-files" -d 'Locate, analyze or upload debug information files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "deploys" -d 'Manage deployments for Sentry releases.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "events" -d 'Manage events on Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "info" -d 'Print information about the configuration and verify authentication.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "issues" -d 'Manage issues in Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "login" -d 'Authenticate with the Sentry server.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "logs" -d '[BETA] Manage logs in Sentry'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "monitors" -d 'Manage cron monitors on Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "organizations" -d 'Manage organizations on Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "proguard" -d 'Manage ProGuard mapping files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "projects" -d 'Manage projects on Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "react-native" -d 'Upload build artifacts for react-native projects.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "releases" -d 'Manage releases on Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "repos" -d 'Manage repositories on Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "send-event" -d 'Send a manual event to Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "send-envelope" -d 'Send a stored envelope to Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "snapshots" -d 'Manage and compare snapshots.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "sourcemaps" -d 'Manage sourcemaps for Sentry releases.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "dart-symbol-map" -d 'Manage Dart/Flutter symbol maps for Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "uninstall" -d 'Uninstall the sentry executable.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "update" -d 'Update the sentry executable.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "upload-dif" -d 'Upload debugging information files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "upload-dsym" -d 'Upload debugging information files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "upload-proguard" -d 'Upload ProGuard mapping files to a project.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and not __fish_seen_subcommand_from completions bash-hook build code-mappings debug-files deploys events info issues login logs monitors organizations proguard projects react-native releases repos send-event send-envelope snapshots sourcemaps dart-symbol-map uninstall update upload-dif upload-dsym upload-proguard help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from build" -f -a "download" -d 'Download a build artifact.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from build" -f -a "upload" -d 'Upload builds to a project.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from build" -f -a "snapshots" -d '[DEPRECATED] Use `sentry snapshots upload` instead.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from code-mappings" -f -a "upload" -d 'Upload code mappings for a project from a JSON file. Each mapping pairs a stack trace root (e.g. com/example/module) with the corresponding source path in your repository (e.g. modules/module/src/main/java/com/example/module).'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from debug-files" -f -a "bundle-sources" -d 'Create a source bundle for a given debug information file'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from debug-files" -f -a "check" -d 'Check the debug info file at a given path.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from debug-files" -f -a "bundle-jvm" -d 'Create a source bundle for the given JVM based source files (e.g. Java, Kotlin, ...)'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from debug-files" -f -a "find" -d 'Locate debug information files for given debug identifiers.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from debug-files" -f -a "print-sources" -d 'Print source files linked by the given debug info file.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from debug-files" -f -a "upload" -d 'Upload debugging information files.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from deploys" -f -a "list" -d 'List all deployments of a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from deploys" -f -a "new" -d 'Creates a new release deployment.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from events" -f -a "list" -d 'List all events in your organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from issues" -f -a "list" -d 'List all issues in your organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from issues" -f -a "mute" -d 'Bulk mute all selected issues.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from issues" -f -a "resolve" -d 'Bulk resolve all selected issues.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from issues" -f -a "unresolve" -d 'Bulk unresolve all selected issues.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from logs" -f -a "list" -d '[BETA] List logs from your organization'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from monitors" -f -a "list" -d 'List all monitors for an organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from monitors" -f -a "run" -d 'Wraps a command'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from organizations" -f -a "list" -d 'List all organizations available to the authenticated token.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from proguard" -f -a "upload" -d 'Upload ProGuard mapping files to a project.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from proguard" -f -a "uuid" -d 'Compute the UUID for a ProGuard mapping file.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from projects" -f -a "list" -d 'List all projects for an organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from react-native" -f -a "gradle" -d 'Upload react-native projects in a gradle build step.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from releases" -f -a "deploys" -d 'Manage deployments for Sentry releases.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from releases" -f -a "archive" -d 'Archive a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from releases" -f -a "delete" -d 'Delete a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from releases" -f -a "finalize" -d 'Mark a release as finalized and released.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from releases" -f -a "info" -d 'Print information about a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from releases" -f -a "list" -d 'List the most recent releases.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from releases" -f -a "new" -d 'Create a new release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from releases" -f -a "propose-version" -d 'Propose a version name for a new release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from releases" -f -a "restore" -d 'Restore a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from releases" -f -a "set-commits" -d 'Set commits of a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from repos" -f -a "list" -d 'List all repositories in your organization.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from snapshots" -f -a "diff" -d 'Compare two directories of snapshot images locally using odiff.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from snapshots" -f -a "download" -d 'Download baseline snapshot images from Sentry.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from snapshots" -f -a "upload" -d 'Upload snapshots to a project.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from sourcemaps" -f -a "inject" -d 'Fixes up JavaScript source files and sourcemaps with debug ids.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from sourcemaps" -f -a "resolve" -d 'Resolve sourcemap for a given line/column position.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from sourcemaps" -f -a "upload" -d 'Upload sourcemaps for a release.'
complete -c sentry -n "__fish_sentry_cli_using_subcommand help; and __fish_seen_subcommand_from dart-symbol-map" -f -a "upload" -d 'Upload a Dart/Flutter symbol map (dartsymbolmap) for deobfuscating Dart exception types.'
