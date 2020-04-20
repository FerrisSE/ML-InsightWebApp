package rest;
import java.util.ArrayList;

import weka.classifiers.Classifier;
import weka.core.Attribute;
import weka.core.DenseInstance;
import weka.core.Instance;
import weka.core.Instances;

public class SolutionTest {

    public static void main(String[] args) {
        SolutionTest q = new SolutionTest();
        double result = q.classify(1.0d, 1, 1);
        System.out.println(result);
    }

    private Instance inst_co;

    public double classify(double lat, double lon, double co)  {

        // Create attributes to be used with classifiers
        // Test the model
        double result = -1;
        try {

            ArrayList<Attribute> attributeList = new ArrayList<Attribute>(2);

            Attribute latitude = new Attribute("latitude");
            Attribute longitude = new Attribute("longitude");
            Attribute carbonmonoxide = new Attribute("co");

            ArrayList<String> classVal = new ArrayList<String>();
            classVal.add("ClassA");
            classVal.add("ClassB");


            attributeList.add(latitude);
            attributeList.add(longitude);
            attributeList.add(carbonmonoxide);
            attributeList.add(new Attribute("@@class@@",classVal));

            Instances data = new Instances("TestInstances",attributeList,0);


            // Create instances for each pollutant with attribute values latitude,
            // longitude and pollutant itself
            inst_co = new DenseInstance(data.numAttributes());
            data.add(inst_co);

            // Set instance's values for the attributes "latitude", "longitude", and
            // "pollutant concentration"
            inst_co.setValue(latitude, lat);
            inst_co.setValue(longitude, lon);
            inst_co.setValue(carbonmonoxide, co);
            // inst_co.setMissing(cluster);

            // load classifier from file
            Classifier cls_co = (Classifier) weka.core.SerializationHelper
                    .read("/CO_J48Model.model");

            result = cls_co.classifyInstance(inst_co);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return result;
    }
}