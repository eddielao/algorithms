import java.util.List;

/**
 * Created by eddie on 5/8/17.
 */


public class ArrayList {

  public static void main(String[] args) {

    List<String> list = new java.util.ArrayList<>();

//    Adding to list
    list.add("Amber");
    list.add("Eddie");
    list.add("Fafa");

//    Random access (by index). Time complexity is O(N).
    System.out.println(
      "Size of list: " + list.size() + "\n" +
      "Random access by index, (1): " + list.get(1));

//    Removing by index. Remove operation is O(N) because because every element afterward needs to be shifted up.
    list.remove(0);

    for(String s : list)
      System.out.println(s);
  }
}
