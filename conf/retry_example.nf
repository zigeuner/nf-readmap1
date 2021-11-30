/*
* This configuration file is the an example for showing fail retry
*/

process {
    // definition of the local executor. Run the pipeline in the current computer.
    executor="local"

    // resources for default process execution
    memory='0.6G'
    cpus='1'
    time='6h'

       // retry three times if fails and then fail
        withLabel: 'retry_and_fail' {
       		  time = { 10.second * task.attempt }
     	      errorStrategy = 'retry' 
    	      maxRetries = 3	
        }

       // retry three times if fails and then fail
        withLabel: 'retry_and_ignore' {
       		  time = { 10.second * task.attempt }
            errorStrategy = {task.attempt <= 3 ? 'retry' : 'ignore'}
        }
}
