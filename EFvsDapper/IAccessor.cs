using EFvsDapper.DataContracts;
using System;

namespace EFvsDapper
{
    interface IAccessor
    {
        Athlete FindAthlete(long athleteId);

        List<Athlete> FindAthletes();
        Athlete[] FindByPosition(string position);
        Athlete SaveAthlete(Athlete athlete);
        TeamAthletes FindTeamWithAthletes(long teamId);
    }
}
