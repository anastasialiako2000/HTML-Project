package routePlanning_classes;

import java.util.*;

public class Route {

    public static List<ArrayList<String>> BestFitBinPacking(List<String> clients, List<Double> demand, double capacity,
            int trucks) {

        ArrayList<String> new_route = new ArrayList<String>();
        List<ArrayList<String>> routes = new ArrayList<ArrayList<String>>();
        routes.add(new_route);
        double truck_capacity_left[] = new double[trucks];

        for (int j = 0; j < truck_capacity_left.length; j++) {
            truck_capacity_left[j] = capacity;
        }

        for (int i = 0; i < clients.size(); i++) {
            String to_be_assigned = clients.get(i);
            int index_of_best_bin = -1;
            double minimum_capacity_left = 1000000000;
            int routes_left = routes.size();

            for (int b = 0; b < routes_left; b++) {
                if (truck_capacity_left[b] >= demand.get(i)) {
                    if (truck_capacity_left[b] < minimum_capacity_left) {
                        minimum_capacity_left = truck_capacity_left[b];
                        index_of_best_bin = b;
                    }
                }
            }

            if (index_of_best_bin != -1) {
                ArrayList<String> ro = routes.get(index_of_best_bin);
                ro.add(to_be_assigned);
                routes.set(index_of_best_bin, ro);
                truck_capacity_left[index_of_best_bin] = truck_capacity_left[index_of_best_bin] - demand.get(i);
            } else {
                if (trucks > routes.size()) {
                    new_route = new ArrayList<String>();
                    new_route.add(to_be_assigned);
                    truck_capacity_left[routes.size()] = truck_capacity_left[routes.size()] - demand.get(i);
                    routes.add(new_route);
                }
            }
        }
        return routes;
    }

}