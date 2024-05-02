baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"packages"
		spec package: #SemanticSqueak.
		
		"groups"
		spec group: #default with: #(SemanticSqueak)].