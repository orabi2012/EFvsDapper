using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFvsDapper.DataContracts;
using System.Data.SqlClient;
using System.Configuration;
using Dapper;
using DapperExtensions;
using System.Data;

namespace EFvsDapper
{
    class DapperAccessor : IAccessor
    {
        private string _ConnectionString = ConfigurationManager.ConnectionStrings["Context"].ConnectionString;

        public Athlete FindAthlete(long athleteId)
        {
            using (var conn = new SqlConnection(_ConnectionString))
            {
                return conn.Query<Athlete>(@"select * from Athletes where Id = @Id", new { Id = athleteId }).FirstOrDefault();
            }
        }

        public List<Athlete> FindAthletes()
        {


            using (var conn = new SqlConnection(_ConnectionString))
            {
                string sqlQuery = "select * from Athletes";
                // IEnumerable<Athlete> P;

                var results = conn.Query<Athlete>(sqlQuery);

                return results.ToList();
            }
        }
        public Athlete SaveAthlete(Athlete athlete)
        {
            using (var conn = new SqlConnection(_ConnectionString))
            {
                conn.Open();

                if (athlete.Id == 0)
                {
                    athlete.Id = conn.Insert(athlete);
                }
                else
                {
                    conn.Update(athlete);
                }

                return athlete;
            }
        }

        public Athlete[] FindByPosition(string position)
        {
            using (var conn = new SqlConnection(_ConnectionString))
            {
                return conn.Query<Athlete>(
                        @"select *
                          from Athletes
                          where Position = @Position",
                          new { Position = position }).ToArray();
            }
        }

        public TeamAthletes FindTeamWithAthletes(long teamId)
        {
            using (var conn = new SqlConnection(_ConnectionString))
            {
                var team = conn.Query<Team>(
                    @"select *
                      from Teams
                      where Id = @Id",
                      new { Id = teamId }
                    ).FirstOrDefault();
                var athletes = conn.Query<Athlete>(
                    @"select Athletes.* 
                      from Athletes
                      join Athlete_Team on Athletes.Id = Athlete_Team.AthleteId
                      where Athlete_Team.TeamId = @TeamId",
                      new { TeamId = teamId }).ToArray();

                return new TeamAthletes
                {
                    Team = team,
                    Athletes = athletes,
                };
            }
        }
    }
}
