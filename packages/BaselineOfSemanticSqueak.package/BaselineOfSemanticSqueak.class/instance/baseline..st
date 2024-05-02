baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec
			baseline: 'SemanticText' with: [
				spec repository: 'github://LinqLover/Squeak-SemanticText:main'];
			baseline: 'SimulationStudio' with: [
				spec
					repository: 'github://LinqLover/SimulationStudio/packages';
					loads: #('SimulationStudio-Base' 'SimulationStudio-Sandbox')].
		
		"packages"
		spec package: #SemanticSqueak with:
			[spec requires: #('SemanticText' 'SimulationStudio')].
		
		"groups"
		spec group: #default with: #(SemanticSqueak)].