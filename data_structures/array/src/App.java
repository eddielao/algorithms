/**
 * Created by eddie on 5/8/17.
 */

public class App {

    public static void main(String[] args) {

        // Size of array needs to be specified at creation time
        int[] nums = new int[5];

        for(int i=1;i<nums.length;++i)
            nums[i] = 2*i;

        // O(1) random index
        int num = nums[3];
        System.out.println(num);

        // O(N) linear search
        for(int i=1;i<nums.length;++i)
            if( nums[i] == 4 )
                System.out.println("Index found, " + i);
    }
}
