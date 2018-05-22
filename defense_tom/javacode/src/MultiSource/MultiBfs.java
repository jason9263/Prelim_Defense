package MultiSource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;

public class MultiBfs {

    public static HashSet<Integer> hset1 = new HashSet<>();
    public static HashSet<Integer> hset2 = new HashSet<>();

    public static void main(String[] args) {
        multisourceinit(1,1,5,5);
        multisourcelevelnumber(1,1,5,5,hset1);
        System.out.println();
        multisourcelevelnumber(5,5,5,5,hset2);

    }

    public static void multisourceinit(int i1, int j1, int i2, int j2){
        int m = 5;
        int n = 5;


        for(int i = 1; i <= m; i++){
            for(int j = 1; j <= n; j++){

                if (Math.abs(i - i1) + Math.abs(j - j1) < Math.abs(i- i2) + Math.abs(j - j2)) {
                    hset1.add((i-1)*m + j);

                }else{
                    hset2.add((i-1)*m + j);
                }
            }
        }

        for (Integer cur : hset1){
            //System.out.print(cur + " ");
        }

        for (Integer cur : hset2){
            //System.out.print(cur + " ");
        }


    }

    public static void multisourcelevelnumber(int sx, int sy , int m, int n ,HashSet<Integer> globalset){

        System.out.print(1 + " ");

        HashSet<Integer> curset = new HashSet<>();

        Queue<MultiSource.Rnode> q = new LinkedList<MultiSource.Rnode>();

        q.add(new MultiSource.Rnode(sx,sy));
        q.add(null);
        LinkedList<MultiSource.Rnode> list = new LinkedList<MultiSource.Rnode>();
        ArrayList<Integer> cntlist = new ArrayList<>();
        cntlist.add(1);

        int curcnt = 1;
        int nextcnt = 0;

        curset.add((sx - 1) * m + sy);

        while (q.size() > 0) {
            MultiSource.Rnode tmp = ((LinkedList<MultiSource.Rnode>) q).pop();

            if (tmp == null && q.size() == 0) {
                return;
            } else if (tmp == null && q.size() != 0) {
                ((LinkedList<MultiSource.Rnode>) q).add(null);
                cntlist.add(nextcnt);
                System.out.print(nextcnt + " ");
                nextcnt = 0;
            } else {
                if (multisourcevalid(tmp.x - 1, tmp.y, m, n,globalset,curset)) {
                    ((LinkedList<MultiSource.Rnode>) q).add(new MultiSource.Rnode(tmp.x - 1, tmp.y));
                    curset.add((tmp.x - 1 - 1) * m + tmp.y);
                    nextcnt++;
                }
                if ( multisourcevalid(tmp.x + 1, tmp.y, m, n,globalset,curset)) {
                    ((LinkedList<MultiSource.Rnode>) q).add(new MultiSource.Rnode(tmp.x + 1, tmp.y));
                    curset.add((tmp.x + 1 - 1) * m + tmp.y);
                    nextcnt++;
                }

                if ( multisourcevalid(tmp.x, tmp.y - 1, m, n,globalset,curset)) {
                    ((LinkedList<MultiSource.Rnode>) q).add(new MultiSource.Rnode(tmp.x, tmp.y - 1));
                    curset.add((tmp.x - 1) * m + (tmp.y - 1));
                    nextcnt++;
                }

                if ( multisourcevalid(tmp.x, tmp.y + 1, m, n,globalset,curset)) {
                    ((LinkedList<MultiSource.Rnode>) q).add(new MultiSource.Rnode(tmp.x, tmp.y + 1));
                    curset.add((tmp.x - 1) * m + tmp.y + 1);
                    nextcnt++;
                }
            }
        }
    }

    public static boolean multisourcevalid(int x, int y , int m , int n, HashSet<Integer> globalset, HashSet<Integer> curset){
        if (x > m || x < 1 || y > n || y < 1) {
            return false;
        }

        if (!globalset.contains((x - 1) * m + y)){
            return false;
        }

        if (curset.contains((x - 1) * m + y)) {
            return false;
        }

        return true;

    }
}
