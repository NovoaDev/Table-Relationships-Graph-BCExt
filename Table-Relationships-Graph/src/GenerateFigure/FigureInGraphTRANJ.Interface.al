/// <summary>
/// Interface "FigureInGraphTR_ANJ."
/// </summary>
interface FigureInGraphTR_ANJ
{
    Access = Public;

    /// <summary>
    /// GenerateFigureText.
    /// </summary>
    /// <param name="Identity">Text.</param>
    /// <param name="Content">Text.</param>
    /// <returns>Return value of type Text.</returns>
    procedure GenerateFigureText(Identity: Text; Content: Text): Text;
}