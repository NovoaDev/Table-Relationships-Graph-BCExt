/// <summary>
/// Codeunit "RhombusIMPTR_ANJ" (ID 80752) implements Interface FigureInGraphTR_ANJ.
/// </summary>
codeunit 80752 RhombusIMPTR_ANJ implements FigureInGraphTR_ANJ
{
    Access = Internal;

    /// <summary>
    /// GenerateFigureText.
    /// </summary>
    /// <param name="Identity">Text.</param>
    /// <param name="Content">Text.</param>
    /// <returns>Return value of type Text.</returns>
    internal procedure GenerateFigureText(Identity: Text; Content: Text): Text;
    begin
        exit(StrSubstNo(FigureLbl, Identity, Content));
    end;

    var
        FigureLbl: Label '%1{%2}';
}