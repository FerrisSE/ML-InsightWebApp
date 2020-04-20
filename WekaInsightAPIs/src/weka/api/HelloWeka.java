package weka.api;
import java.io.File;

import service.NumericPrediction;
import weka.*;
import weka.core.Instances;
import weka.core.converters.ArffLoader;
import weka.core.converters.CSVLoader;
import weka.core.converters.ConverterUtils.DataSource;

public class HelloWeka {
	static String result;

	public static void main(String[] args) throws Exception {
		System.out.println("Hello Weka");
		File fileTrain = new File("./ArffSamples/weather.numeric.arff");
		File fileTest = new File("./ArffSamples/weather.numeric.arff");

		CSVLoader sourceTrainCSV;

		CSVLoader sourceTestCSV;

		
		

		//sourceTrain = new ArffLoader();
				//sourceTrain.setSource(new File("./ArffSamples/weather.numeric.arff"));
		//sourceTest = new ArffLoader();
				//sourceTest.setSource(new File("./ArffSamples/weather.numeric.arff"));
		
		DataSource sourceTrain = new DataSource("./ArffSamples/weather.numeric.arff");

			

		DataSource sourceTest = new DataSource("./ArffSamples/weather.numeric.arff");
	
		Instances trainDataset = sourceTrain.getDataSet();	
		Instances testDataset = sourceTest.getDataSet();	
		
		System.out.println(NumericPrediction.numericPrediction(fileTrain,fileTest));
		result=NumericPrediction.numericPrediction(fileTrain,fileTest);
	}

	public static String getResult() {
		return result;
	}
}
