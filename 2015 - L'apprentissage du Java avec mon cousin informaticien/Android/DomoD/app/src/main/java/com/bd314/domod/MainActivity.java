package com.bd314.domod;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.util.Log;
import android.view.View.OnClickListener;
import android.widget.Switch;
import java.io.IOException;

import com.squareup.okhttp.Call;
import com.squareup.okhttp.Callback;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Request.Builder;
import com.squareup.okhttp.Response;


public class MainActivity extends AppCompatActivity {

        Switch switch1;
        Switch switch2;
        Switch switch3;


        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_main);

            this.switch1 = (Switch) findViewById(R.id.switch1);
            this.switch2 = (Switch) findViewById(R.id.switch2);
            this.switch3 = (Switch) findViewById(R.id.switch3);
            this.switch1.setOnClickListener(new switch1());
            this.switch2.setOnClickListener(new switch2());
            this.switch3.setOnClickListener(new switch3());

            Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
            setSupportActionBar(toolbar);

            FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
            fab.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Snackbar.make(view, "Rafraichissement effectué", Snackbar.LENGTH_SHORT)
                            .setAction("Action", null).show();
                }

            });

        }

        class switch1 implements OnClickListener {

            public void onClick(View v) {
                if (((Switch) v).isChecked()) {
                    Log.v("Switch1", "On");
                    MainActivity.this.lightChange("a", 1);
                    return;
                }
                Log.v("Switch1", "Off");
                MainActivity.this.lightChange("a", 0);
            }
        }


        class switch2 implements OnClickListener {

            public void onClick(View v) {
                if (((Switch) v).isChecked()) {
                    Log.v("Switch2", "On");
                    MainActivity.this.lightChange("b", 1);
                    return;
                }
                Log.v("Switch1", "Off");
                MainActivity.this.lightChange("b", 0);
            }
        }


        class switch3 implements OnClickListener {

            public void onClick(View v) {
                if (((Switch) v).isChecked()) {
                    Log.v("Switch3", "On");
                    MainActivity.this.lightChange("c", 1);
                    return;
                }
                Log.v("Switch3", "Off");
                MainActivity.this.lightChange("c", 0);
            }
        }

        public void accessURL(String url){
            OkHttpClient client = new OkHttpClient();

            Request request = new Request.Builder()
                    .url(url).build();

            Call call = client.newCall(request);

            call.enqueue(new Callback() {
                @Override
                public void onFailure(Request request, IOException e) {

                    Log.e("HttpService", "onFailure() Request was: " + request);

                    e.printStackTrace();
                }

                @Override
                public void onResponse(Response r) throws IOException {



                }
            });

        }


        class C00285 implements Callback {


            class C00031 implements Runnable {
                final /* synthetic */ String val$response;

                C00031(String str) {
                    this.val$response = str;
                }

                public void run() {
                    MainActivity.this.changeSwitch(this.val$response);
                }
            }


            public void onFailure(Request request, IOException e) {
                Log.v("Okhttp", "Erreur -> refresh");
            }

            public void onResponse(Response response) throws IOException {
                try {
                    if (response.isSuccessful()) {
                        String okttpreturn = response.body().string().replace("\n", " ");
                        Log.v("Okhttp", "Receive : " + okttpreturn);
                        parse(okttpreturn);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            private void parse(String response) {
                MainActivity.this.runOnUiThread(new C00031(response));
                Log.v(BuildConfig.FLAVOR, response);
            }
        }


        protected void onResume() {
            super.onResume();
            buttonOnClick(null);
        }

        public void lightChange(String letterSwitch, int state) {
            String commandLine = "http://192.168.0.37/get.php?switch=" + letterSwitch + "&state=" + state;
            Log.v("URL", commandLine);
            accessURL(commandLine);
        }

        protected void changeSwitch(String response) {
            this.switch1 = (Switch) findViewById(R.id.switch1);
            this.switch2 = (Switch) findViewById(R.id.switch2);
            this.switch3 = (Switch) findViewById(R.id.switch3);
            if (response.charAt(0) == '1') {
                if (response.charAt(2) == '1') {
                    this.switch1.setChecked(true);
                } else {
                    this.switch1.setChecked(false);
                }
            }
            if (response.charAt(4) == '2') {
                if (response.charAt(6) == '1') {
                    this.switch2.setChecked(true);
                } else {
                    this.switch2.setChecked(false);
                }
            }
            if (response.charAt(8) != '3') {
                return;
            }
            if (response.charAt(10) == '1') {
                this.switch3.setChecked(true);
            } else {
                this.switch3.setChecked(false);
            }
        }

        public void buttonOnClick(View v) {
            new OkHttpClient().newCall(new Builder().url("http://192.168.0.37/eta433.txt").build()).enqueue(new C00285());
        }






    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}






