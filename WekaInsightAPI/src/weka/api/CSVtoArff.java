package weka.api;

//importing required classes//
import weka.core.Instances;
import weka.core.converters.ArffSaver;
import weka.core.converters.CSVLoader;
import java.io.File;
//------------------------//


public class CSVtoArff {
	public static void main(String args[]) throws Exception{
		//Load CSV
		CSVLoader loader = new CSVLoader();
		loader.setSource(new File("./CSVsamples/weather.numeric.csv"));
		Instances data = loader.getDataSet();
		
		//save ARFF
		ArffSaver saver = new ArffSaver();
		saver.setInstances(data);	//set the dataset we want to convert
		
		//save as ARFF

		saver.setFile(new File("./ArffSamples/weather.numeric.arff"));
		saver.writeBatch();
	}

}
