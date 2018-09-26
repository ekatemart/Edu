package dijkstra;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;


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
        int[] whereCameFrom = new int[n];
        int temp;
        List<Integer> routes = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            graph.add(new ArrayList<>());
        }

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
                    whereCameFrom[graph.get(closerVertex).get(k).vertex] = closerVertex;
                }
            }
            block[closerVertex] = true;

        }

        routes.add(n);
        temp = n - 1;
        while (temp != 0) {
            routes.add(whereCameFrom[temp] + 1);
            temp = whereCameFrom[temp];
        }

        String listString = routes.stream().map(Object::toString)
                .collect(Collectors.joining(" "));

        if (path[n - 1] == Double.MAX_VALUE) {
            out.println("-1");
        } else {
            for (int i = routes.size() - 1; -1 < i; i--) {
                out.print(routes.get(i) + " ");
            }
        }
        out.close();
    }
}

