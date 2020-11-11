class textGenerator {

  PrintWriter output;

  textGenerator() {
    output = createWriter("text.txt");
  }

  void display() {
    point(mouseX, mouseY);
    output.println(mouseX + "t" + mouseY); // Write the coordinate to the file
  }


}
