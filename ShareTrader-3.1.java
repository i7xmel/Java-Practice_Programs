public class ShareTrader {
    static int maxProfit;
    public static int findMaxProfit(int[] stockprices) {
        int n = stockprices.length;
        int profit = 0;
        int buyprice = stockprices[0];
        for(int i=1;i<n;i++) {
            if(stockprices[i] < stockprices[i-1]) {
                profit += stockprices[i-1] - buyprice;
                buyprice = stockprices[i];
            }

        }
        profit += stockprices[n-1] -buyprice;
        return profit;
    }
    public static void main(String[] args) {
        int[] prices1 = {10, 22, 5, 75, 65, 80};
        int[] prices2 = {2, 30, 15, 10, 8, 25, 80};
        System.out.println("Prices 1: " + findMaxProfit(prices1));
        System.out.println("Prices 2: " + findMaxProfit(prices2));
    }
}
