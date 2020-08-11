package br.com.bigdataservices.tasklet;

import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.bigdataservices.service.UserService;

@Service
public class BatchTasklet implements Tasklet {
	
	@Autowired
	private UserService userService;

	@Override
	public RepeatStatus execute(final StepContribution contribution, final ChunkContext context) throws Exception {
		System.out.println(context.getStepContext().getJobParameters().get("jobName").toString());
		userService.userList();
		Thread.sleep(10000); 
		return RepeatStatus.FINISHED;
	}

}
