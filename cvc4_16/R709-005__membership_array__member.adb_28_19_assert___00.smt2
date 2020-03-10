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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

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

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (natural natural) Bool)

(declare-const dummy2 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-fun init (Int) us_t)

(declare-fun init__function_guard (us_t Int) Bool)

(declare-sort my_count 0)

(declare-fun my_countqtint (my_count) Int)

;; my_count'axiom
  (assert
  (forall ((i my_count))
  (and (<= 1 (my_countqtint i)) (<= (my_countqtint i) 5))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (my_count my_count) Bool)

(declare-const dummy4 my_count)

(declare-datatypes ((my_count__ref 0))
(((my_count__refqtmk (my_count__content my_count)))))
(define-fun my_count__ref_my_count__content__projection ((a my_count__ref)) my_count 
  (my_count__content a))

(define-fun dynamic_invariant ((temp___expr_181 Int)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (or (= temp___is_init_177 true)
                                     (<= 1 5)) (in_range4 temp___expr_181)))

(define-fun dynamic_invariant1 ((temp___expr_188 us_t)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (=>
                                     (not (= temp___skip_constant_185 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_188)
                                     (last1 temp___expr_188))))

(declare-datatypes ((t15b__ref 0))
(((t15b__refqtmk (t15b__content us_t)))))
(define-fun t15b__ref_t15b__content__projection ((a t15b__ref)) us_t 
  (t15b__content a))

(declare-fun temp_____aggregate_def_200 (Int Int Int) us_t)

;; init__post_axiom
  (assert
  (forall ((c Int))
  (! (=> (dynamic_invariant c true true true true)
     (let ((result (init c)))
     (=> (init__function_guard result c) (dynamic_invariant1 result true
     false true true)))) :pattern ((init c)) )))

;; init__def_axiom
  (assert
  (forall ((c Int))
  (! (=> (dynamic_invariant c true true true true)
     (= (init c) (let ((temp___207 (temp_____aggregate_def_200 0 c (+ c 9))))
                 (of_array (to_array temp___207) (first1 temp___207)
                 (last1 temp___207))))) :pattern ((init c)) )))

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort tarray_1_10P1 0)

(declare-fun tarray_1_10P1qtint (tarray_1_10P1) Int)

;; tarray_1_10P1'axiom
  (assert
  (forall ((i tarray_1_10P1))
  (and (<= 1 (tarray_1_10P1qtint i)) (<= (tarray_1_10P1qtint i) 10))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (tarray_1_10P1 tarray_1_10P1) Bool)

(declare-const dummy5 tarray_1_10P1)

(declare-datatypes ((tarray_1_10P1__ref 0))
(((tarray_1_10P1__refqtmk (tarray_1_10P1__content tarray_1_10P1)))))
(define-fun tarray_1_10P1__ref_tarray_1_10P1__content__projection ((a tarray_1_10P1__ref)) tarray_1_10P1 
  (tarray_1_10P1__content a))

(declare-sort t9b 0)

(declare-fun t9bqtint (t9b) Int)

;; t9b'axiom
  (assert (forall ((i t9b)) (and (<= 2 (t9bqtint i)) (<= (t9bqtint i) 11))))

(define-fun in_range6 ((x Int)) Bool (and (<= 2 x) (<= x 11)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (t9b t9b) Bool)

(declare-const dummy6 t9b)

(declare-datatypes ((t9b__ref 0))
(((t9b__refqtmk (t9b__content t9b)))))
(define-fun t9b__ref_t9b__content__projection ((a t9b__ref)) t9b (t9b__content
                                                                 a))

(declare-sort t11b 0)

(declare-fun t11bqtint (t11b) Int)

;; t11b'axiom
  (assert
  (forall ((i t11b)) (and (<= 1 (t11bqtint i)) (<= (t11bqtint i) 10))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (t11b t11b) Bool)

(declare-const dummy7 t11b)

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content t11b)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) t11b 
  (t11b__content a))

(declare-fun member__a__aggregate_def (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_231 (Int) (Array Int natural))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range3
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___202 Int) (temp___203 Int) (temp___204 Int))
  (let ((temp___201 (temp_____aggregate_def_200 temp___202 temp___203
                    temp___204)))
  (=> (dynamic_invariant2 temp___202 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___203 temp___204)
  (and (= (first1 temp___201) temp___203) (= (last1 temp___201) temp___204)))
  (forall ((temp___205 Int))
  (= (select (to_array temp___201) temp___205) rliteral)))))))

;; def_axiom
  (assert
  (forall ((temp___209 Int))
  (=> (dynamic_invariant2 temp___209 true true true true)
  (forall ((temp___210 Int))
  (= (select (member__a__aggregate_def temp___209) temp___210) rliteral)))))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 1))

;; def_axiom
  (assert
  (forall ((temp___233 Int))
  (=> (dynamic_invariant2 temp___233 true true true true)
  (forall ((temp___234 Int))
  (= (select (temp_____aggregate_def_231 temp___233) temp___234) rliteral1)))))

(assert
;; defqtvc
 ;; File "member.adb", line 1, characters 0-0
  (not
  (let ((member__a__assume (of_array (member__a__aggregate_def 0) 2 11)))
  (forall ((a (Array Int natural)))
  (=> (= a (to_array member__a__assume))
  (=> (= (to_rep a__first) (first1 member__a__assume))
  (=> (= (to_rep a__last) (last1 member__a__assume))
  (=> (dynamic_property 1 2147483647 (to_rep a__first) (to_rep a__last))
  (=> (init__function_guard (init 1) 1)
  (=>
  (let ((temp___214 (init 1)))
  (and (= (first1 temp___214) 1) (= (last1 temp___214) 10)))
  (=> (init__function_guard (init 2) 2)
  (=> (init__function_guard (init 1) 1)
  (=>
  (= (let ((temp___224 (init 2)))
     (let ((temp___223 (init 1)))
     (bool_eq (to_array temp___223) (first1 temp___223) (last1 temp___223)
     (to_array temp___224) (first1 temp___224) (last1 temp___224)))) true)
  (=> (init__function_guard (init 1) 1)
  (let ((temp___227 (init 1)))
  (or
  (=> (init__function_guard (init 2) 2)
  (= (bool_eq1 temp___227 (init 2)) true))
  (=> (init__function_guard (init 3) 3)
  (= (bool_eq1 temp___227 (init 3)) true))))))))))))))))))
(check-sat)
(exit)
