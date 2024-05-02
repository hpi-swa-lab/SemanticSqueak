preferences
integrateIntoInspectors
	<preference: 'Integrate semantic agent into inspectors' category: 'Semantic Squeak' description: nil type: #Boolean>

	^ IntegrateIntoInspectors ifNil: [false]