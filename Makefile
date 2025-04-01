.PHONY: all clean get gen web test

all: gen web

clean:
	flutter clean -v

get:
	flutter pub get -v

gen:
	flutter pub run build_runner build --delete-conflicting-outputs

web:
	flutter build web --dart-define=ENV=prod --release --no-web-resources-cdn --base-href=/console/ -v

test-run:
	flutter test
