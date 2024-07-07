fprintf("Welcome to Shape Creator!/n")
validate = true;
while validate 
prompt = "please choose the shape to create: \n 1: Circle \n 2: Rectangle \n 3: Square \n 4: Triangle \n 5: Equilateral Triangle\n 6: exit \n";
 choice = input(prompt);

switch choice
    
    case 1
    radius = input("Choose a Radius: ")  ;
    color = input("\nChoose a Color: ");
    c = Circle(radius,color);
    Draw(c)
    break;
    case 2
    length = input("Choose a length: ");
    width = input("\nChoose a width: ");
    color = input("\nChoose a color: ");
    r = Rectangle(length,width,color);
    Draw(r)
    break;
    case 3
    SL = input("Choose a side length: ");
    color = input("\nChoose a color: ");
    s = Square(SL,color);
    Draw(s)
    break;
    case 4
    b = input("Choose a base size: ");
    h = input("\n Choose a height: ");
    color = input("\nChoose a color: ");
    t = Triangle(b,h,color);
    Draw(t)
    break;
    case 5
    SL = input("Choose a side length: ");
    color = input("\n Choose a Color: ");
    e = EquilateralTriangle(SL,color);
    Draw(e);
    break;
    case 6
    validate = false;
    break;


end
end