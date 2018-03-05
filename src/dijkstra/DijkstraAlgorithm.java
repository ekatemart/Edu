package dijkstra;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


public class DijkstraAlgorithm {

    static class Edge {
        double weight;
        int vertex;

        Edge(double weight, int vertex) {
            this.weight = weight;
            this.vertex = vertex;
        }
    }


    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        PrintWriter out = new PrintWriter(System.out);
        int n = in.nextInt();
        int m = in.nextInt();
        List<List<Edge>> graph = new ArrayList<>(n);
        double[] path = new double[n];
        boolean[] block = new boolean[n];
        double closerPath;
        int closerVertex = 0;
        List<String> route = new ArrayList<>(n);

        for (int i = 0; i < n; i++) {
            graph.add(new ArrayList<>());
            route.add("");
        }

        route.set(0, "1");

        for (int i = 0; i < m; i++) {
            int a = in.nextInt() - 1;
            int b = in.nextInt() - 1;
            double w = in.nextInt();
            graph.get(a).add(new Edge(w, b));
            graph.get(b).add(new Edge(w, a));
        }

        for (int i = 1; i < n; i++) {
            path[i] = Double.MAX_VALUE;
        }

        if (graph.get(1) == null) {
            out.println("-1");
            return;
        }
        for (int i = 0; i < n; i++) { // проверка на остаток непосещённых вершин
            closerPath = Double.MAX_VALUE;
            for (int j = 0; j < n; j++) { // поиск ближайшей к первой непосещённой вершины
                if ((path[j] < closerPath) & (!block[j])) {
                    closerPath = path[j];
                    closerVertex = j;
                }
            }
            for (int k = 0; k < graph.get(closerVertex).size(); k++) { // просматриваю рёбра из текущей вершины
                if ((path[closerVertex] + graph.get(closerVertex).get(k).weight) < path[graph.get(closerVertex).get(k).vertex]) {
                    path[graph.get(closerVertex).get(k).vertex] = path[closerVertex] + graph.get(closerVertex).get(k).weight;
                    route.set(graph.get(closerVertex).get(k).vertex, route.get(closerVertex) + " " + (graph.get(closerVertex).get(k).vertex + 1));
                }
            }
            block[closerVertex] = true;

        }

        if (path[n - 1] == Double.MAX_VALUE) {
            out.println("-1");
        } else {
            out.println(route.get(n-1));
        }
        out.close();
    }
}

