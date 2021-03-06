baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec configuration: 'KomHttpServer' with: [
			spec
				version: #stable;
				repository: 'http://www.squeaksource.com/MetacelloRepository'].
		spec package: 'RatPack' with: [spec requires: #('KomHttpServer')]].

	spec for: #squeak do: [
		spec package: 'Cryptography' with: [
			spec repository: 'http://www.squeaksource.com/Cryptography' ].
		spec package: 'PostgresV2' with: [
			spec repository: 'http://www.squeaksource.com/PostgresV2';
				file: 'PostgresV2-EdwinDH.29'].
		spec package: 'VB-Regex' with: [
			spec repository: 'http://www.squeaksource.com/Regex' ].
		spec package: 'JSON' with: [
			spec repository: 'http://www.squeaksource.com/JSON' ].
		spec package: 'RatPack' with: [
			spec requires: #('libraries').
			spec postLoadDoIt: #squeakRegisterInWorldMenu].
	spec
				group: 'default' with: #('RatPack');
				group: 'libraries' with: #('KomHttpServer' 'VB-Regex' 'JSON' 'Cryptography' 'PostgresV2');
				group: 'Tests' with: #('RatPack');
				group: 'TravisCI' with: #('Tests')	];
				yourself
