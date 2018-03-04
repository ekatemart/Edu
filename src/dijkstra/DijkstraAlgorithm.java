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



    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        PrintWriter out = new PrintWriter(System.out);
        int n = in.nextInt();
        int m = in.nextInt();
        List<List<Edge>> graph = new ArrayList<>(n);
        double[] pass = new double[n];
        boolean[] block = new boolean[n];
        double closerpass = Double.MAX_VALUE;
        int closervertex = 0;

        for (int i = 0; i < m; i++){
            int a = in.nextInt();
            int b = in.nextInt();
            double w = in.nextInt();
            if (graph.get(a) == null) {
                graph.set(a, new ArrayList<>());
            }
            graph.get(a).add(new Edge(w, b));
            if (graph.get(b) == null) {
                graph.set(b, new ArrayList<>());
            }
            graph.get(b).add(new Edge(w, a));
        }

        for (int i = 1; i < n; i++){
            pass[i] = Double.MAX_VALUE;
        }

        if (graph.get(1) == null) {
            out.println("-1");
        }
        else{
            for (int i = 0; i < n; i++){ // проверка на остаток непосещённых вершин
                while (block[i] == false){
                    for (int j = 0; j < n; j++){ // поиск ближайшей к первой непосещённой вершины
                        if ((pass[j] < closerpass) & (block[j] == false)) {
                            closerpass = pass[j];
                            closervertex = j + 1;
                        }
                    }
                    for (int k = 0; k < graph.get(closervertex).size(); k++){ // просматриваю рёбра из текущей вершины
                        if ((pass[closervertex - 1] + graph.get(closervertex).get(k).weight) < pass[graph.get(closervertex).get(k).vertex - 1]){
                            pass[graph.get(closervertex).get(k).vertex - 1] = pass[closervertex - 1] + graph.get(closervertex).get(k).weight;
                        }
                    }
                    block[closervertex - 1] = true;
                }
            }
        }

        if (pass[n - 1] == Double.MAX_VALUE){
            out.println("-1");
        }
        else{
            out.print(pass[n - 1]);
        }
    }
}

