using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Geppetto;
using Project;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void GoToKitchenVAISSELLE()
        {
            // Arrange
            var model = new Model();
            var commandes = new Commandes(model);
            var sprite = new Sprite();
            var expectedX = 1020; // Coordonnée X attendue après le déplacement
            var expectedY = 230; // Coordonnée Y attendue après le déplacement

            // Act
            commandes.GoToKitchenVAISSELLE(sprite);

            // Assert
            // Vérifiez si le sprite s'est déplacé vers la bonne position
            Assert.AreEqual(expectedX, sprite.PictureBoxLocation);
            Assert.AreEqual(expectedY, sprite.PictureBoxLocation);

        }
    }

}