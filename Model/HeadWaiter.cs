using SpriteLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project
{
    public class HeadWaiter
    {
        public int posX { get; set; }
        public int posY { get; set; }

        public Sprite sprite { get; set; }
        public HeadWaiter(int posX, int posY)
        {
            this.posX = posX;
            this.posY = posY;
        }

    }
}
