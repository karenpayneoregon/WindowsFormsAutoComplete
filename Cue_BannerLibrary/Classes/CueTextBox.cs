using System;
using System.ComponentModel;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace Cue_BannerLibrary
{
    public class CueTextBox : TextBox
    {
        [Category("WaterMark"),Description("Text to display for cue text")]
        [Localizable(true)]
        public string Cue
        {
            get { return mCue; }
            set { mCue = value; updateCue(); }
        }
        [Category("WaterMark"), Description("Cue text behavior")]
        public WaterMark WaterMarkOption { get { return mWaterMark; }  set { mWaterMark = value; updateCue(); } }

        void updateCue()
        {
            if (this.IsHandleCreated && mCue != null)
            {
                SendMessage(this.Handle, 0x1501, (IntPtr)WaterMarkOption, mCue);
            }
        }
        protected override void OnHandleCreated(EventArgs e)
        {
            base.OnHandleCreated(e);
            updateCue();
        }
        private string mCue = "Enter text";
        private WaterMark mWaterMark = WaterMark.Hide;

        [DllImport("user32.dll", CharSet = CharSet.Unicode)]
        static extern IntPtr SendMessage(IntPtr hWnd, int msg, IntPtr wp, string lp);
    }
}
