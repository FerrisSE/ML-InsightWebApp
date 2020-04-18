package service;

import weka.classifiers.functions.SMOreg;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;

public class NumericPrediction {
	public static String numericPrediction() {
		
		String testResult="";
		String result="";
		int count=0;
		int total=0;
		
		try {
		//load training dataset
			DataSource source = new DataSource("./ArffSamples/iris.arff");
			Instances trainDataset = source.getDataSet();	
			//set class index to the last attribute
			trainDataset.setClassIndex(trainDataset.numAttributes()-1);

			//build model
			SMOreg smo = new SMOreg();
			smo.buildClassifier(trainDataset);
			//output model
			System.out.println(smo);

			//load new dataset
			DataSource source1 = new DataSource("./ArffSamples/iris.arff");
			Instances testDataset = source1.getDataSet();	
			//set class index to the last attribute
			testDataset.setClassIndex(testDataset.numAttributes()-1);

			//loop through the new dataset and make predictions
			System.out.println("===================");
			System.out.println("Actual Class, SMO Predicted");
			for (int i = 0; i < testDataset.numInstances(); i++) {
				//get class double value for current instance
				double actualValue = testDataset.instance(i).classValue();

				//get Instance object of current instance
				Instance newInst = testDataset.instance(i);
				//call classifyInstance, which returns a double value for the class
				double predSMO = smo.classifyInstance(newInst);
				
				result = actualValue+", "+predSMO;
				
				if(actualValue == predSMO) count++;
				System.out.println(result);
				testResult = testResult+"\n"+result;
				total=i;
			}
		}catch(Exception e) {
			System.out.println("An error occurred. Please make sure that you are using the accepted file formats."+"\n"+"If files are correct, please contact support for additional help");
		}
		return testResult;
	}
}
