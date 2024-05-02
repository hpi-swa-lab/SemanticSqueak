baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec
			baseline: 'SemanticText' with: [
				spec repository: 'github://LinqLover/Squeak-SemanticText:main'].
		
		"packages"
		spec package: #SemanticSqueak with:
			[spec requires: 'SemanticText'].
		
		"groups"
		spec group: #default with: #(SemanticSqueak)].