using EFvsDapper.DataContracts;
using EFvsDapper.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Entity;

namespace EFvsDapper
{
    public class EFAccessor : IAccessor
    {
        public Athlete SaveAthlete(Athlete athlete)
        {
            using (var db = new Context())
            {
                db.Entry(athlete).State = athlete.Id == 0 ? EntityState.Added : EntityState.Modified;
                db.SaveChanges();
            }
            return athlete;
        }

        public Athlete FindAthlete(long athleteId)
        {
            using (var db = new Context())
            {
                return db.Set<Athlete>().Find(athleteId);
            }
        }

        public List<Athlete> FindAthletes()
        {
            using (var db = new Context())
            {

                string sqlQuery = "select * from Athletes";
                // IEnumerable<Athlete> P;

                var results = db.Athletes.ToList();

                return results.ToList();
            }
        }

        public Athlete[] FindByPosition(string position)
        {
            using (var db = new Context())
            {
                return db.Set<Athlete>().Where(athlete => athlete.Position.Equals(position, StringComparison.OrdinalIgnoreCase)).ToArray();
            }
        }

        public TeamAthletes FindTeamWithAthletes(long teamId)
        {
            using (var db = new Context())
            {
                var team = db.Set<Team>().Find(teamId);
                var teamathletes = (
                    from athletes in db.Set<Athlete>()
                    join at in db.Set<AthleteTeam>() on athletes.Id equals at.AthleteId
                    where at.TeamId == teamId
                    select athletes
                    ).ToArray();
                return new TeamAthletes
                {
                    Team = team,
                    Athletes = teamathletes,
                };
            }
        }
    }
}
