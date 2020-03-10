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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-const one Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
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

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-const first Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ((my_positive__ref 0))
(((my_positive__refqtmk (my_positive__content integer)))))
(define-fun my_positive__ref_my_positive__content__projection ((a my_positive__ref)) integer 
  (my_positive__content a))

(declare-sort tTbSP1 0)

(declare-fun tTbSP1qtint (tTbSP1) Int)

;; tTbSP1'axiom
  (assert
  (forall ((i tTbSP1)) (and (<= 1 (tTbSP1qtint i)) (<= (tTbSP1qtint i) 2))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (tTbSP1 tTbSP1) Bool)

(declare-const dummy3 tTbSP1)

(declare-datatypes ((tTbSP1__ref 0))
(((tTbSP1__refqtmk (tTbSP1__content tTbSP1)))))
(define-fun tTbSP1__ref_tTbSP1__content__projection ((a tTbSP1__ref)) tTbSP1 
  (tTbSP1__content a))

(declare-sort tTbSP2 0)

(declare-fun tTbSP2qtint (tTbSP2) Int)

;; tTbSP2'axiom
  (assert
  (forall ((i tTbSP2)) (and (<= 1 (tTbSP2qtint i)) (<= (tTbSP2qtint i) 2))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (tTbSP2 tTbSP2) Bool)

(declare-const dummy4 tTbSP2)

(declare-datatypes ((tTbSP2__ref 0))
(((tTbSP2__refqtmk (tTbSP2__content tTbSP2)))))
(define-fun tTbSP2__ref_tTbSP2__content__projection ((a tTbSP2__ref)) tTbSP2 
  (tTbSP2__content a))

(declare-sort t15b 0)

(declare-fun t15bqtint (t15b) Int)

;; t15b'axiom
  (assert
  (forall ((i t15b)) (and (<= 3 (t15bqtint i)) (<= (t15bqtint i) 4))))

(define-fun in_range5 ((x Int)) Bool (and (<= 3 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq5 (t15b t15b) Bool)

(declare-const dummy5 t15b)

(declare-datatypes ((t15b__ref 0))
(((t15b__refqtmk (t15b__content t15b)))))
(define-fun t15b__ref_t15b__content__projection ((a t15b__ref)) t15b 
  (t15b__content a))

(declare-sort t16b 0)

(declare-fun t16bqtint (t16b) Int)

;; t16b'axiom
  (assert
  (forall ((i t16b)) (and (<= 0 (t16bqtint i)) (<= (t16bqtint i) 1))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq6 (t16b t16b) Bool)

(declare-const dummy6 t16b)

(declare-datatypes ((t16b__ref 0))
(((t16b__refqtmk (t16b__content t16b)))))
(define-fun t16b__ref_t16b__content__projection ((a t16b__ref)) t16b 
  (t16b__content a))

(declare-sort tTfSP1 0)

(declare-fun tTfSP1qtint (tTfSP1) Int)

;; tTfSP1'axiom
  (assert
  (forall ((i tTfSP1)) (and (<= 1 (tTfSP1qtint i)) (<= (tTfSP1qtint i) 2))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq7 (tTfSP1 tTfSP1) Bool)

(declare-const dummy7 tTfSP1)

(declare-datatypes ((tTfSP1__ref 0))
(((tTfSP1__refqtmk (tTfSP1__content tTfSP1)))))
(define-fun tTfSP1__ref_tTfSP1__content__projection ((a tTfSP1__ref)) tTfSP1 
  (tTfSP1__content a))

(declare-sort tTfSP2 0)

(declare-fun tTfSP2qtint (tTfSP2) Int)

;; tTfSP2'axiom
  (assert
  (forall ((i tTfSP2)) (and (<= 1 (tTfSP2qtint i)) (<= (tTfSP2qtint i) 2))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq8 (tTfSP2 tTfSP2) Bool)

(declare-const dummy8 tTfSP2)

(declare-datatypes ((tTfSP2__ref 0))
(((tTfSP2__refqtmk (tTfSP2__content tTfSP2)))))
(define-fun tTfSP2__ref_tTfSP2__content__projection ((a tTfSP2__ref)) tTfSP2 
  (tTfSP2__content a))

(declare-sort t18b 0)

(declare-fun t18bqtint (t18b) Int)

;; t18b'axiom
  (assert
  (forall ((i t18b)) (and (<= 0 (t18bqtint i)) (<= (t18bqtint i) 1))))

(define-fun in_range9 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE10 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check10 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE10 (us_image) Int)

(declare-fun user_eq9 (t18b t18b) Bool)

(declare-const dummy9 t18b)

(declare-datatypes ((t18b__ref 0))
(((t18b__refqtmk (t18b__content t18b)))))
(define-fun t18b__ref_t18b__content__projection ((a t18b__ref)) t18b 
  (t18b__content a))

(declare-sort t19b 0)

(declare-fun t19bqtint (t19b) Int)

;; t19b'axiom
  (assert
  (forall ((i t19b)) (and (<= 3 (t19bqtint i)) (<= (t19bqtint i) 4))))

(define-fun in_range10 ((x Int)) Bool (and (<= 3 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE11 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check11 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE11 (us_image) Int)

(declare-fun user_eq10 (t19b t19b) Bool)

(declare-const dummy10 t19b)

(declare-datatypes ((t19b__ref 0))
(((t19b__refqtmk (t19b__content t19b)))))
(define-fun t19b__ref_t19b__content__projection ((a t19b__ref)) t19b 
  (t19b__content a))

(declare-fun array_aggr__bi_dim_aggr_ok__aggregate_ko2__b__aggregate_def (Int) map1)

(declare-fun array_aggr__bi_dim_aggr_ok__aggregate_ko2__f__aggregate_def (Int) map1)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= first 2147483647)) (dynamic_property
                                     first 2147483647 temp___expr_160)))

;; first__def_axiom
  (assert (= first one))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___315 Int))
  (=> (dynamic_invariant temp___315 true true true true)
  (forall ((temp___316 Int) (temp___317 Int))
  (= (get
     (array_aggr__bi_dim_aggr_ok__aggregate_ko2__b__aggregate_def temp___315)
     temp___316 temp___317) rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___320 Int))
  (=> (dynamic_invariant temp___320 true true true true)
  (forall ((temp___321 Int) (temp___322 Int))
  (= (get
     (array_aggr__bi_dim_aggr_ok__aggregate_ko2__f__aggregate_def temp___320)
     temp___321 temp___322) rliteral)))))

(assert
;; defqtvc
 ;; File "array_aggr.adb", line 17, characters 0-0
  (not
  (=> (dynamic_invariant one true false true true)
  (=> (dynamic_invariant one true false true true)
  (=> (<= one 1) (=> (<= 3 4) (<= first 3)))))))
(check-sat)
(exit)
