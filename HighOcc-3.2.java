public class HighOcc {
    static int n;
    static int[] array;

    static void occurrence(int k) {
        int[] high_occ = new int[n];
        int count;
        int v = 0;
        int maxcount = 0;

        for (int i = 0; i < n; i++) {
            count = 0;

            for (int j = 0; j < n; j++) {
                if (array[j] == array[i])
                    ++count;
            }

            if (count >= 1) {
                int flag = 0;
                for (int x = 0; x <= v; x++) {
                    if (array[i] == high_occ[x])
                        flag = 1;
                }

                if (flag == 0) {
                    if (count > maxcount || (count == maxcount && array[i] > high_occ[0])) {
                        maxcount = count;
                        for (int x = v; x > 0; x--) {
                            high_occ[x] = high_occ[x - 1];
                        }
                        high_occ[0] = array[i];
                    } else {
                        v++;
                        high_occ[v] = array[i];
                    }
                }
            }
        }

        System.out.println("Top " + k + " elements with the highest occurrence:");
        for (int j = 0; j < k && j <= v; j++) {
            System.out.println(high_occ[j]);
        }
    }

    public static void main(String[] args) {
        HighOcc s = new HighOcc();
        Scanner input = new Scanner(System.in);

        System.out.println("Enter the number of elements");
        s.n = input.nextInt();
        s.array = new int[s.n];

        System.out.println("Enter the elements");
        for (int i = 0; i < s.n; i++) {
            s.array[i] = input.nextInt();
        }

        System.out.println("Enter the value of K");
        int k = input.nextInt();

        s.occurrence(k);
    }
}
