package com.bd314.domod;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Switch;

import com.squareup.okhttp.Call;
import com.squareup.okhttp.Callback;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;

import java.io.IOException;

public class MainActivity extends AppCompatActivity {

    Switch switch1;
    Switch switch2;
    Switch switch3;

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

        return super.onOptionsItemSelected(item);}


    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        this.switch1 = (Switch) findViewById(R.id.switch1);
        this.switch2 = (Switch) findViewById(R.id.switch2);
        this.switch3 = (Switch) findViewById(R.id.switch3);
        this.switch1.setOnClickListener(new switch1());
        this.switch2.setOnClickListener(new switch2());
        this.switch3.setOnClickListener(new switch3());

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Actualisation des états..", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
    }

        class switch1 implements View.OnClickListener {

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


        class switch2 implements View.OnClickListener {

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


        class switch3 implements View.OnClickListener {

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
            client.newCall(request).enqueue(new Callback() {

                @Override
                public void onFailure(Request request, IOException e) {
                    Log.v("Okhttp", "Onfailure");
                }
                @Override
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
            });
        }



        private void parse(String response) { //use response
            Log.v("result: ",response);
        }


        public void lightChange(String letterSwitch, int state) {
            String commandLine = "http://192.168.0.129/switchcontrol.php?switch=" + letterSwitch + "&state=" + state;
            Log.v("URL", commandLine);
            accessURL(commandLine);
        }

        protected void changeSwitch(String response) { //Work but not use
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

    }

