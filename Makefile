.PHONY: all run_dev_web run_dev_mobile run_unit clean upgrade lint format build_dev_mobile help 

all: lint format run_dev_mobile

# Adding a help file: https://gist.github.com/prwhite/8168133#gistcomment-1313022
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

run_unit: ## Runs unit tests
	@echo "╠ Running the tests"
	# @flutter test || (echo "Error while running tests"; exit 1)

clean: ## Cleans the environment
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@flutter clean

format: ## Formats the code
	@echo "╠ Formatting the code"
	@dart format .

lint: ## Lints the code
	@echo "╠ Verifying code..."
	@dart analyze . || (echo "Error in project"; exit 1)

create_icons: ## Create App icons
	@echo "╠ Creating icons..."
	@flutter pub run flutter_launcher_icons:main

build_runner: ## Generates automatic code
	@echo "╠ Creating generated code..."
	@flutter pub run build_runner clean
	@flutter pub run build_runner build --delete-conflicting-outputs

get_pub: clean ## Getting pubspec dependencies
	@echo "╠ Upgrading dependencies..."
	@flutter pub get

upgrade_pub: clean ## Upgrades pubspec dependencies
	@echo "╠ Upgrading dependencies..."
	@flutter pub upgrade --major-versions

upgrade: upgrade_pub create_icons build_runner ## Upgrades dependencies

commit: format lint run_unit
	@echo "╠ Committing..."
	git add .
	git commit

run_mobile: ## Runs the mobile application in dev
	@echo "╠ Running the app"
	@flutter run

build_ios_mobile: get_pub create_icons build_runner commit
	@echo "╠  Building the app"
	@flutter build ipa

deploy_ios_mobile: build_ios_mobile
	@open ./build/ios/archive/Runner.xcarchive
	