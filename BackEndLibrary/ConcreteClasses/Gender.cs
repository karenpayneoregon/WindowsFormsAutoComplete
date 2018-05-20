namespace BackEndLibrary
{
    public class Gender
    {
        public int Identifier { get; set; }
        public string Value { get; set; }
        public override string ToString()
        {
            return Value;
        }
    }
}
