﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFvsDapper.DataContracts
{
    public class TeamAthletes
    {
        public Team Team { get; set; }

        public Athlete[] Athletes { get; set; }
    }
}
