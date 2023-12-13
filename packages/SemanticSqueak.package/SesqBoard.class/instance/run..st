running - private
run: aStrategy

	processes add:
		([aStrategy runFor: self]
			newProcess
				name: aStrategy name;
				priority: Processor systemBackgroundPriority;
				resume).