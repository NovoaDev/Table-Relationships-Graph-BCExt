/// <summary>
/// Enum "GeometricFigureTR_ANJ" (ID 80750) implements Interface FigureInGraphTR_ANJ.
/// </summary>
enum 80750 GeometricFigureTR_ANJ implements FigureInGraphTR_ANJ
{
    Access = Public;
    Caption = 'Geometric Figure';
    Extensible = true;

    value(0; SquareRectangle)
    {
        Caption = 'Square/Rectangle';
        Implementation = FigureInGraphTR_ANJ = SquareRectangleIMPTR_ANJ;
    }
    value(1; Circle)
    {
        Caption = 'Circle';
        Implementation = FigureInGraphTR_ANJ = CircleIMPTR_ANJ;
    }
    value(2; RoundRectangle)
    {
        Caption = 'Round Rectangle';
        Implementation = FigureInGraphTR_ANJ = RoundRectangleIMPTR_ANJ;
    }
    value(3; Rhombus)
    {
        Caption = 'Rhombus';
        Implementation = FigureInGraphTR_ANJ = RhombusIMPTR_ANJ;
    }
}