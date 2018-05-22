package MultiSource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;

public class BFS {

    public static void main(String[] args) {
        createlevel(5,5);
    }

    public static void createlevel(int m, int n) {
        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                System.out.print(1 + " ");
                levelnumber(5, 5, i, j);
                System.out.println("");
            }
        }
    }

    public static void levelnumber(int m, int n, int i, int j) {

        HashSet<Integer> hset = new HashSet<>();

        Queue<Rnode> q = new LinkedList<Rnode>();

        q.add(new Rnode(i, j));
        q.add(null);
        LinkedList<Rnode> list = new LinkedList<Rnode>();
        ArrayList<Integer> cntlist = new ArrayList<>();
        cntlist.add(1);

        int curcnt = 1;
        int nextcnt = 0;

        hset.add((i - 1) * m + j);

        while (q.size() > 0) {
            Rnode tmp = ((LinkedList<Rnode>) q).pop();

            if (tmp == null && q.size() == 0) {
                return;
            } else if (tmp == null && q.size() != 0) {
                ((LinkedList<Rnode>) q).add(null);
                cntlist.add(nextcnt);
                System.out.print(nextcnt + " ");
                nextcnt = 0;
            } else {
                if (valid(hset, tmp.x - 1, tmp.y, m, n)) {
                    ((LinkedList<Rnode>) q).add(new Rnode(tmp.x - 1, tmp.y));
                    hset.add((tmp.x - 1 - 1) * m + tmp.y);
                    nextcnt++;
                }
                if (valid(hset, tmp.x + 1, tmp.y, m, n)) {
                    ((LinkedList<Rnode>) q).add(new Rnode(tmp.x + 1, tmp.y));
                    hset.add((tmp.x + 1 - 1) * m + tmp.y);
                    nextcnt++;
                }

                if (valid(hset, tmp.x, tmp.y - 1, m, n)) {
                    ((LinkedList<Rnode>) q).add(new Rnode(tmp.x, tmp.y - 1));
                    hset.add((tmp.x - 1) * m + (tmp.y - 1));
                    nextcnt++;
                }

                if (valid(hset, tmp.x, tmp.y + 1, m, n)) {
                    ((LinkedList<Rnode>) q).add(new Rnode(tmp.x, tmp.y + 1));
                    hset.add((tmp.x - 1) * m + tmp.y + 1);
                    nextcnt++;
                }
            }
        }

        for (int index = 0; index < cntlist.size(); index++) {
            System.out.println(cntlist.get(index));
        }

    }

    public static boolean valid(HashSet<Integer> hset, int x, int y, int m, int n) {
        if (x > m || x < 1 || y > n || y < 1) {
            return false;
        }

        if (hset.contains((x - 1) * m + y)) {
            return false;
        }
        return true;
    }

}
