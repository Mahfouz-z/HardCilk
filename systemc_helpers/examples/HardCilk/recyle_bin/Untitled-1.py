


        def doesSpawnItself(task: Task):
            if task.name in hardCilkSystem.spawnList.keys():
                spawnedTasks = hardCilkSystem.spawnList[task.name]
                return task.name in hardCilkSystem.spawnList[task.name]
            return False

                taskIn = Interface(
                    name=f"{processingElement.name}/taskIn",
                    parentName=processingElement.name,
                    protocol=InterfaceProtocol.Axis,
                    kind=InterfaceKind.TaskIn,
                    config=AxisConfig(task.widthArg, 0))
                processingElement.interfaces.append(taskIn)
                
                hardCilkSystem.connections.append((taskIn.name, f"{task.name}_stealSide_taskOut_{i}"))
                
                if doesSpawnItself(task):
                    pass

                task.processingElements.append(processingElement)