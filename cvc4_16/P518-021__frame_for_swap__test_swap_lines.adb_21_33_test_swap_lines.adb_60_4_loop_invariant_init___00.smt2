(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort map1 0)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content map1)))))
(declare-fun get (map1 Int Int) natural)

(declare-fun set (map1 Int Int natural) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((a natural))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((a natural))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide (map1 Int Int Int Int) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first Int) (old_first Int))
  (forall ((new_first_2 Int) (old_first_2 Int))
  (forall ((i Int))
  (forall ((j Int))
  (! (= (get (slide a old_first new_first old_first_2 new_first_2) i j) 
  (get a (- i (- new_first old_first)) (- j (- new_first_2 old_first_2)))) :pattern (
  (get (slide a old_first new_first old_first_2 new_first_2) i j)) )))))))

(define-fun bool_eq ((a map1) (a__first Int) (a__last Int) (a__first_2 Int)
  (a__last_2 Int) (b map1) (b__first Int) (b__last Int) (b__first_2 Int)
  (b__last_2 Int)) Bool (ite (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (<= a__first_2 a__last_2)
                             (and (<= b__first_2 b__last_2)
                             (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
                             (< b__last_2 b__first_2)))
                             (forall ((temp___idx_154 Int)
                             (temp___idx_155 Int))
                             (=>
                             (and
                             (and (<= a__first temp___idx_154)
                             (<= temp___idx_154 a__last))
                             (and (<= a__first_2 temp___idx_155)
                             (<= temp___idx_155 a__last_2)))
                             (= (to_rep
                                (get a temp___idx_154 temp___idx_155)) 
                             (to_rep
                             (get b (+ (- b__first a__first) temp___idx_154)
                             (+ (- b__first_2 a__first_2) temp___idx_155)))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (b__first Int) (b__last Int) (b__first_2 Int) (b__last_2 Int))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (<= a__first_2 a__last_2)
  (and (<= b__first_2 b__last_2)
  (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
  (< b__last_2 b__first_2)))
  (forall ((temp___idx_154 Int) (temp___idx_155 Int))
  (=>
  (and (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (and (<= a__first_2 temp___idx_155) (<= temp___idx_155 a__last_2)))
  (= (to_rep (get a temp___idx_154 temp___idx_155)) (to_rep
                                                    (get b
                                                    (+ (- b__first a__first) temp___idx_154)
                                                    (+ (- b__first_2 a__first_2) temp___idx_155)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const c62b map1)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const c77b map1)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const c96b map1)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-sort tTmSP1 0)

(declare-fun tTmSP1qtint (tTmSP1) Int)

;; tTmSP1'axiom
  (assert
  (forall ((i tTmSP1)) (and (<= 1 (tTmSP1qtint i)) (<= (tTmSP1qtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tTmSP1 tTmSP1) Bool)

(declare-const dummy2 tTmSP1)

(declare-datatypes ((tTmSP1__ref 0))
(((tTmSP1__refqtmk (tTmSP1__content tTmSP1)))))
(define-fun tTmSP1__ref_tTmSP1__content__projection ((a tTmSP1__ref)) tTmSP1 
  (tTmSP1__content a))

(declare-sort tTmSP2 0)

(declare-fun tTmSP2qtint (tTmSP2) Int)

;; tTmSP2'axiom
  (assert
  (forall ((i tTmSP2)) (and (<= 1 (tTmSP2qtint i)) (<= (tTmSP2qtint i) 10))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (tTmSP2 tTmSP2) Bool)

(declare-const dummy3 tTmSP2)

(declare-datatypes ((tTmSP2__ref 0))
(((tTmSP2__refqtmk (tTmSP2__content tTmSP2)))))
(define-fun tTmSP2__ref_tTmSP2__content__projection ((a tTmSP2__ref)) tTmSP2 
  (tTmSP2__content a))

(declare-sort t64b 0)

(declare-fun t64bqtint (t64b) Int)

;; t64b'axiom
  (assert
  (forall ((i t64b)) (and (<= 1 (t64bqtint i)) (<= (t64bqtint i) 10))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (t64b t64b) Bool)

(declare-const dummy4 t64b)

(declare-datatypes ((t64b__ref 0))
(((t64b__refqtmk (t64b__content t64b)))))
(define-fun t64b__ref_t64b__content__projection ((a t64b__ref)) t64b 
  (t64b__content a))

(declare-sort t79b 0)

(declare-fun t79bqtint (t79b) Int)

;; t79b'axiom
  (assert
  (forall ((i t79b)) (and (<= 0 (t79bqtint i)) (<= (t79bqtint i) 9))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 9)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq5 (t79b t79b) Bool)

(declare-const dummy5 t79b)

(declare-datatypes ((t79b__ref 0))
(((t79b__refqtmk (t79b__content t79b)))))
(define-fun t79b__ref_t79b__content__projection ((a t79b__ref)) t79b 
  (t79b__content a))

(declare-sort t98b 0)

(declare-fun t98bqtint (t98b) Int)

;; t98b'axiom
  (assert
  (forall ((i t98b)) (and (<= 1 (t98bqtint i)) (<= (t98bqtint i) 10))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq6 (t98b t98b) Bool)

(declare-const dummy6 t98b)

(declare-datatypes ((t98b__ref 0))
(((t98b__refqtmk (t98b__content t98b)))))
(define-fun t98b__ref_t98b__content__projection ((a t98b__ref)) t98b 
  (t98b__content a))

(declare-fun temp_____aggregate_def_232 (Int Int Int) map1)

(declare-fun temp_____aggregate_def_249 (Int Int Int) map1)

(declare-fun temp_____aggregate_def_269 (Int) map1)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 2))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 1))

(declare-const rliteral2 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral2) 0))

;; def_axiom
  (assert
  (forall ((temp___234 Int) (temp___235 Int) (temp___236 Int))
  (let ((temp___233 (temp_____aggregate_def_232 temp___234 temp___235
                    temp___236)))
  (=>
  (and
  (and (dynamic_invariant temp___234 true true true true) (dynamic_invariant
  temp___235 true true true true)) (dynamic_invariant temp___236 true true
  true true))
  (forall ((temp___237 Int) (temp___238 Int))
  (ite (= temp___237 7) (= (get temp___233 temp___237 temp___238) rliteral)
  (ite (= temp___237 5) (= (get temp___233 temp___237 temp___238) rliteral1)
  (= (get temp___233 temp___237 temp___238) rliteral2))))))))

;; def_axiom
  (assert
  (forall ((temp___251 Int) (temp___252 Int) (temp___253 Int))
  (let ((temp___250 (temp_____aggregate_def_249 temp___251 temp___252
                    temp___253)))
  (=>
  (and
  (and (dynamic_invariant temp___251 true true true true) (dynamic_invariant
  temp___252 true true true true)) (dynamic_invariant temp___253 true true
  true true))
  (forall ((temp___254 Int) (temp___255 Int))
  (ite (= temp___254 7) (= (get temp___250 temp___254 temp___255) rliteral)
  (ite (= temp___254 5) (= (get temp___250 temp___254 temp___255) rliteral1)
  (= (get temp___250 temp___254 temp___255) rliteral2))))))))

;; def_axiom
  (assert
  (forall ((temp___271 Int))
  (=> (dynamic_invariant temp___271 true true true true)
  (forall ((temp___272 Int) (temp___273 Int))
  (= (get (temp_____aggregate_def_269 temp___271) temp___272 temp___273) 
  rliteral2)))))

(assert
;; defqtvc
 ;; File "test_swap_lines.adb", line 1, characters 0-0
  (not
  (forall ((tmp Int) (tmp1 Int) (m map1) (m1 map1) (m2 map1) (c Int)
  (temp___loop_entry_267 map1) (i Int))
  (=> (= m (temp_____aggregate_def_232 1 2 0))
  (=> (= m c62b)
  (=> (dynamic_invariant tmp false false true true)
  (=>
  (exists ((c1 Int))
  (and (= c1 1)
  (ite (= (and (ite (<= 1 c1) true false) (ite (<= c1 10) true false)) true)
  (exists ((temp___loop_entry_247 map1))
  (and (= temp___loop_entry_247 m)
  (exists ((temp___loop_entry_248 map1))
  (and (= temp___loop_entry_248 m)
  (exists ((m3 map1) (tmp2 Int) (c2 Int))
  (and
  (forall ((i1 Int))
  (=> (and (<= 1 i1) (<= i1 (- c2 1)))
  (and (= (to_rep (get m3 5 i1)) (to_rep (get temp___loop_entry_247 7 i1)))
  (= (to_rep (get m3 7 i1)) (to_rep (get temp___loop_entry_248 5 i1))))))
  (and
  (= (and (ite (and
               (and (in_range5 c2) (dynamic_invariant tmp2 false true true
               true))
               (forall ((temp___244 Int) (temp___245 Int))
               (=>
               (and (and (<= 1 temp___244) (<= temp___244 10))
               (and (<= 1 temp___245) (<= temp___245 10)))
               (=>
               (and
               (or (< 10 temp___245)
               (or (< temp___245 1)
               (or (<= c2 temp___245) (not (= 7 temp___244)))))
               (or (< 10 temp___245)
               (or (< temp___245 1)
               (or (<= c2 temp___245) (not (= 5 temp___244))))))
               (= (get m3 temp___244 temp___245) (get m temp___244
                                                 temp___245))))))
          true false) (ite (and (<= 1 c2) (<= c2 10)) true false)) true)
  (exists ((o Int))
  (and (= (to_rep (get m3 5 c2)) o)
  (exists ((tmp3 Int))
  (and (= tmp3 o)
  (exists ((o1 Int))
  (and (= (to_rep (get m3 7 c2)) o1)
  (exists ((o2 natural))
  (and (= (to_rep o2) o1)
  (exists ((m4 map1))
  (and (= m4 (set m3 5 c2 o2))
  (exists ((o3 natural))
  (and (= (to_rep o3) tmp3) (and (= m1 (set m4 7 c2 o3)) (= c2 10)))))))))))))))))))))
  (= m1 m))))
  (=>
  (forall ((i1 Int))
  (=> (and (<= 1 i1) (<= i1 10))
  (forall ((j Int))
  (=> (and (<= 1 j) (<= j 10))
  (ite (= i1 5) (= (to_rep (get m1 i1 j)) 2)
  (ite (= i1 7) (= (to_rep (get m1 i1 j)) 1) (= (to_rep (get m1 i1 j)) 0)))))))
  (=> (= m2 (temp_____aggregate_def_249 1 2 0))
  (=> (= m2 c77b)
  (=> (dynamic_invariant tmp1 false false true true)
  (=> (= c 0)
  (=> (= (and (ite (<= 0 c) true false) (ite (<= c 9) true false)) true)
  (=> (= temp___loop_entry_267 m2)
  (=> (<= 1 i)
  (=> (<= i c)
  (= (to_rep (get m2 5 i)) (to_rep (get temp___loop_entry_267 7 i)))))))))))))))))))
(check-sat)
(exit)
