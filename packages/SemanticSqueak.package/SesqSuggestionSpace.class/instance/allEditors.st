private
allEditors

	^ SystemWindow
		windowsIn: Project current world
		satisfying: [:window | window model isKindOf: CodeHolder]