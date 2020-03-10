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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
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

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun get_v (Int) Int)

(declare-fun get_v__function_guard (Int Int) Bool)

;; get_v__post_axiom
  (assert
  (forall ((check_loop_inv__v Int))
  (! (=> (dynamic_invariant check_loop_inv__v true true true true)
     (let ((result (get_v check_loop_inv__v)))
     (=> (get_v__function_guard result check_loop_inv__v) (dynamic_invariant
     result true false true true)))) :pattern ((get_v check_loop_inv__v)) )))

;; get_v__def_axiom
  (assert
  (forall ((check_loop_inv__v Int))
  (! (=> (dynamic_invariant check_loop_inv__v true true true true)
     (= (get_v check_loop_inv__v) check_loop_inv__v)) :pattern ((get_v
                                                                check_loop_inv__v)) )))

(declare-const r6b Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

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

(declare-sort t3b 0)

(declare-fun t3bqtint (t3b) Int)

;; t3b'axiom
  (assert (forall ((i t3b)) (and (<= 1 (t3bqtint i)) (<= (t3bqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (t3b t3b) Bool)

(declare-const dummy4 t3b)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content t3b)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) t3b (t3b__content
                                                                 a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (integer integer) Bool)

(declare-const dummy5 integer)

(declare-datatypes ((t7b__ref 0))
(((t7b__refqtmk (t7b__content integer)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) integer 
  (t7b__content a))

(declare-sort t9b 0)

(declare-fun t9bqtint (t9b) Int)

;; t9b'axiom
  (assert (forall ((i t9b)) (and (<= 1 (t9bqtint i)) (<= (t9bqtint i) 10))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

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

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (t11b t11b) Bool)

(declare-const dummy7 t11b)

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content t11b)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) t11b 
  (t11b__content a))

(declare-sort t14b 0)

(declare-fun t14bqtint (t14b) Int)

;; t14b'axiom
  (assert
  (forall ((i t14b)) (and (<= 21 (t14bqtint i)) (<= (t14bqtint i) 100))))

(define-fun in_range7 ((x Int)) Bool (and (<= 21 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq8 (t14b t14b) Bool)

(declare-const dummy8 t14b)

(declare-datatypes ((t14b__ref 0))
(((t14b__refqtmk (t14b__content t14b)))))
(define-fun t14b__ref_t14b__content__projection ((a t14b__ref)) t14b 
  (t14b__content a))

(declare-sort t16b 0)

(declare-fun t16bqtint (t16b) Int)

;; t16b'axiom
  (assert
  (forall ((i t16b)) (and (<= 21 (t16bqtint i)) (<= (t16bqtint i) 100))))

(define-fun in_range8 ((x Int)) Bool (and (<= 21 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq9 (t16b t16b) Bool)

(declare-const dummy9 t16b)

(declare-datatypes ((t16b__ref 0))
(((t16b__refqtmk (t16b__content t16b)))))
(define-fun t16b__ref_t16b__content__projection ((a t16b__ref)) t16b 
  (t16b__content a))

(declare-sort t19b 0)

(declare-fun t19bqtint (t19b) Int)

;; t19b'axiom
  (assert
  (forall ((i t19b)) (and (<= 11 (t19bqtint i)) (<= (t19bqtint i) 20))))

(define-fun in_range9 ((x Int)) Bool (and (<= 11 x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE10 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check10 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE10 (us_image) Int)

(declare-fun user_eq10 (t19b t19b) Bool)

(declare-const dummy10 t19b)

(declare-datatypes ((t19b__ref 0))
(((t19b__refqtmk (t19b__content t19b)))))
(define-fun t19b__ref_t19b__content__projection ((a t19b__ref)) t19b 
  (t19b__content a))

(declare-sort t21b 0)

(declare-fun t21bqtint (t21b) Int)

;; t21b'axiom
  (assert
  (forall ((i t21b)) (and (<= 11 (t21bqtint i)) (<= (t21bqtint i) 20))))

(define-fun in_range10 ((x Int)) Bool (and (<= 11 x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE11 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check11 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE11 (us_image) Int)

(declare-fun user_eq11 (t21b t21b) Bool)

(declare-const dummy11 t21b)

(declare-datatypes ((t21b__ref 0))
(((t21b__refqtmk (t21b__content t21b)))))
(define-fun t21b__ref_t21b__content__projection ((a t21b__ref)) t21b 
  (t21b__content a))

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE12 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check12 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE12 (us_image) Int)

(declare-fun user_eq12 (integer integer) Bool)

(declare-const dummy12 integer)

(declare-datatypes ((t68b__ref 0))
(((t68b__refqtmk (t68b__content integer)))))
(define-fun t68b__ref_t68b__content__projection ((a t68b__ref)) integer 
  (t68b__content a))

(declare-sort t73b 0)

(declare-fun t73bqtint (t73b) Int)

;; t73b'axiom
  (assert
  (forall ((i t73b)) (and (<= 1 (t73bqtint i)) (<= (t73bqtint i) 10))))

(define-fun in_range11 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE13 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check13 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE13 (us_image) Int)

(declare-fun user_eq13 (t73b t73b) Bool)

(declare-const dummy13 t73b)

(declare-datatypes ((t73b__ref 0))
(((t73b__refqtmk (t73b__content t73b)))))
(define-fun t73b__ref_t73b__content__projection ((a t73b__ref)) t73b 
  (t73b__content a))

(declare-sort t75b 0)

(declare-fun t75bqtint (t75b) Int)

;; t75b'axiom
  (assert
  (forall ((i t75b)) (and (<= 1 (t75bqtint i)) (<= (t75bqtint i) 10))))

(define-fun in_range12 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE14 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check14 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE14 (us_image) Int)

(declare-fun user_eq14 (t75b t75b) Bool)

(declare-const dummy14 t75b)

(declare-datatypes ((t75b__ref 0))
(((t75b__refqtmk (t75b__content t75b)))))
(define-fun t75b__ref_t75b__content__projection ((a t75b__ref)) t75b 
  (t75b__content a))

(declare-sort t78b 0)

(declare-fun t78bqtint (t78b) Int)

;; t78b'axiom
  (assert
  (forall ((i t78b)) (and (<= 31 (t78bqtint i)) (<= (t78bqtint i) 100))))

(define-fun in_range13 ((x Int)) Bool (and (<= 31 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE15 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check15 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE15 (us_image) Int)

(declare-fun user_eq15 (t78b t78b) Bool)

(declare-const dummy15 t78b)

(declare-datatypes ((t78b__ref 0))
(((t78b__refqtmk (t78b__content t78b)))))
(define-fun t78b__ref_t78b__content__projection ((a t78b__ref)) t78b 
  (t78b__content a))

(declare-sort t80b 0)

(declare-fun t80bqtint (t80b) Int)

;; t80b'axiom
  (assert
  (forall ((i t80b)) (and (<= 31 (t80bqtint i)) (<= (t80bqtint i) 100))))

(define-fun in_range14 ((x Int)) Bool (and (<= 31 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE16 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check16 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE16 (us_image) Int)

(declare-fun user_eq16 (t80b t80b) Bool)

(declare-const dummy16 t80b)

(declare-datatypes ((t80b__ref 0))
(((t80b__refqtmk (t80b__content t80b)))))
(define-fun t80b__ref_t80b__content__projection ((a t80b__ref)) t80b 
  (t80b__content a))

(declare-sort t83b 0)

(declare-fun t83bqtint (t83b) Int)

;; t83b'axiom
  (assert
  (forall ((i t83b)) (and (<= 11 (t83bqtint i)) (<= (t83bqtint i) 20))))

(define-fun in_range15 ((x Int)) Bool (and (<= 11 x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE17 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check17 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE17 (us_image) Int)

(declare-fun user_eq17 (t83b t83b) Bool)

(declare-const dummy17 t83b)

(declare-datatypes ((t83b__ref 0))
(((t83b__refqtmk (t83b__content t83b)))))
(define-fun t83b__ref_t83b__content__projection ((a t83b__ref)) t83b 
  (t83b__content a))

(declare-sort t85b 0)

(declare-fun t85bqtint (t85b) Int)

;; t85b'axiom
  (assert
  (forall ((i t85b)) (and (<= 11 (t85bqtint i)) (<= (t85bqtint i) 20))))

(define-fun in_range16 ((x Int)) Bool (and (<= 11 x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE18 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check18 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE18 (us_image) Int)

(declare-fun user_eq18 (t85b t85b) Bool)

(declare-const dummy18 t85b)

(declare-datatypes ((t85b__ref 0))
(((t85b__refqtmk (t85b__content t85b)))))
(define-fun t85b__ref_t85b__content__projection ((a t85b__ref)) t85b 
  (t85b__content a))

(declare-sort t88b 0)

(declare-fun t88bqtint (t88b) Int)

;; t88b'axiom
  (assert
  (forall ((i t88b)) (and (<= 21 (t88bqtint i)) (<= (t88bqtint i) 30))))

(define-fun in_range17 ((x Int)) Bool (and (<= 21 x) (<= x 30)))

(declare-fun attr__ATTRIBUTE_IMAGE19 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check19 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE19 (us_image) Int)

(declare-fun user_eq19 (t88b t88b) Bool)

(declare-const dummy19 t88b)

(declare-datatypes ((t88b__ref 0))
(((t88b__refqtmk (t88b__content t88b)))))
(define-fun t88b__ref_t88b__content__projection ((a t88b__ref)) t88b 
  (t88b__content a))

(declare-sort t90b 0)

(declare-fun t90bqtint (t90b) Int)

;; t90b'axiom
  (assert
  (forall ((i t90b)) (and (<= 21 (t90bqtint i)) (<= (t90bqtint i) 30))))

(define-fun in_range18 ((x Int)) Bool (and (<= 21 x) (<= x 30)))

(declare-fun attr__ATTRIBUTE_IMAGE20 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check20 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE20 (us_image) Int)

(declare-fun user_eq20 (t90b t90b) Bool)

(declare-const dummy20 t90b)

(declare-datatypes ((t90b__ref 0))
(((t90b__refqtmk (t90b__content t90b)))))
(define-fun t90b__ref_t90b__content__projection ((a t90b__ref)) t90b 
  (t90b__content a))

(define-fun dynamic_property3 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE21 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check21 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE21 (us_image) Int)

(declare-fun user_eq21 (integer integer) Bool)

(declare-const dummy21 integer)

(declare-datatypes ((t137b__ref 0))
(((t137b__refqtmk (t137b__content integer)))))
(define-fun t137b__ref_t137b__content__projection ((a t137b__ref)) integer 
  (t137b__content a))

(declare-datatypes ((t142b__ref 0))
(((t142b__refqtmk (t142b__content us_t)))))
(define-fun t142b__ref_t142b__content__projection ((a t142b__ref)) us_t 
  (t142b__content a))

(declare-sort t139b 0)

(declare-fun t139bqtint (t139b) Int)

;; t139b'axiom
  (assert
  (forall ((i t139b)) (and (<= 31 (t139bqtint i)) (<= (t139bqtint i) 40))))

(define-fun in_range19 ((x Int)) Bool (and (<= 31 x) (<= x 40)))

(declare-fun attr__ATTRIBUTE_IMAGE22 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check22 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE22 (us_image) Int)

(declare-fun user_eq22 (t139b t139b) Bool)

(declare-const dummy22 t139b)

(declare-datatypes ((t139b__ref 0))
(((t139b__refqtmk (t139b__content t139b)))))
(define-fun t139b__ref_t139b__content__projection ((a t139b__ref)) t139b 
  (t139b__content a))

(declare-datatypes ((t144b__ref 0))
(((t144b__refqtmk (t144b__content us_t)))))
(define-fun t144b__ref_t144b__content__projection ((a t144b__ref)) us_t 
  (t144b__content a))

(declare-sort t146b 0)

(declare-fun t146bqtint (t146b) Int)

;; t146b'axiom
  (assert
  (forall ((i t146b)) (and (<= 1 (t146bqtint i)) (<= (t146bqtint i) 10))))

(define-fun in_range20 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE23 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check23 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE23 (us_image) Int)

(declare-fun user_eq23 (t146b t146b) Bool)

(declare-const dummy23 t146b)

(declare-datatypes ((t146b__ref 0))
(((t146b__refqtmk (t146b__content t146b)))))
(define-fun t146b__ref_t146b__content__projection ((a t146b__ref)) t146b 
  (t146b__content a))

(declare-sort t148b 0)

(declare-fun t148bqtint (t148b) Int)

;; t148b'axiom
  (assert
  (forall ((i t148b)) (and (<= 1 (t148bqtint i)) (<= (t148bqtint i) 10))))

(define-fun in_range21 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE24 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check24 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE24 (us_image) Int)

(declare-fun user_eq24 (t148b t148b) Bool)

(declare-const dummy24 t148b)

(declare-datatypes ((t148b__ref 0))
(((t148b__refqtmk (t148b__content t148b)))))
(define-fun t148b__ref_t148b__content__projection ((a t148b__ref)) t148b 
  (t148b__content a))

(declare-sort t151b 0)

(declare-fun t151bqtint (t151b) Int)

;; t151b'axiom
  (assert
  (forall ((i t151b)) (and (<= 41 (t151bqtint i)) (<= (t151bqtint i) 100))))

(define-fun in_range22 ((x Int)) Bool (and (<= 41 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE25 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check25 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE25 (us_image) Int)

(declare-fun user_eq25 (t151b t151b) Bool)

(declare-const dummy25 t151b)

(declare-datatypes ((t151b__ref 0))
(((t151b__refqtmk (t151b__content t151b)))))
(define-fun t151b__ref_t151b__content__projection ((a t151b__ref)) t151b 
  (t151b__content a))

(declare-sort t153b 0)

(declare-fun t153bqtint (t153b) Int)

;; t153b'axiom
  (assert
  (forall ((i t153b)) (and (<= 41 (t153bqtint i)) (<= (t153bqtint i) 100))))

(define-fun in_range23 ((x Int)) Bool (and (<= 41 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE26 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check26 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE26 (us_image) Int)

(declare-fun user_eq26 (t153b t153b) Bool)

(declare-const dummy26 t153b)

(declare-datatypes ((t153b__ref 0))
(((t153b__refqtmk (t153b__content t153b)))))
(define-fun t153b__ref_t153b__content__projection ((a t153b__ref)) t153b 
  (t153b__content a))

(declare-sort t156b 0)

(declare-fun t156bqtint (t156b) Int)

;; t156b'axiom
  (assert
  (forall ((i t156b)) (and (<= 11 (t156bqtint i)) (<= (t156bqtint i) 20))))

(define-fun in_range24 ((x Int)) Bool (and (<= 11 x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE27 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check27 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE27 (us_image) Int)

(declare-fun user_eq27 (t156b t156b) Bool)

(declare-const dummy27 t156b)

(declare-datatypes ((t156b__ref 0))
(((t156b__refqtmk (t156b__content t156b)))))
(define-fun t156b__ref_t156b__content__projection ((a t156b__ref)) t156b 
  (t156b__content a))

(declare-sort t158b 0)

(declare-fun t158bqtint (t158b) Int)

;; t158b'axiom
  (assert
  (forall ((i t158b)) (and (<= 11 (t158bqtint i)) (<= (t158bqtint i) 20))))

(define-fun in_range25 ((x Int)) Bool (and (<= 11 x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE28 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check28 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE28 (us_image) Int)

(declare-fun user_eq28 (t158b t158b) Bool)

(declare-const dummy28 t158b)

(declare-datatypes ((t158b__ref 0))
(((t158b__refqtmk (t158b__content t158b)))))
(define-fun t158b__ref_t158b__content__projection ((a t158b__ref)) t158b 
  (t158b__content a))

(declare-sort t161b 0)

(declare-fun t161bqtint (t161b) Int)

;; t161b'axiom
  (assert
  (forall ((i t161b)) (and (<= 21 (t161bqtint i)) (<= (t161bqtint i) 30))))

(define-fun in_range26 ((x Int)) Bool (and (<= 21 x) (<= x 30)))

(declare-fun attr__ATTRIBUTE_IMAGE29 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check29 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE29 (us_image) Int)

(declare-fun user_eq29 (t161b t161b) Bool)

(declare-const dummy29 t161b)

(declare-datatypes ((t161b__ref 0))
(((t161b__refqtmk (t161b__content t161b)))))
(define-fun t161b__ref_t161b__content__projection ((a t161b__ref)) t161b 
  (t161b__content a))

(declare-sort t163b 0)

(declare-fun t163bqtint (t163b) Int)

;; t163b'axiom
  (assert
  (forall ((i t163b)) (and (<= 21 (t163bqtint i)) (<= (t163bqtint i) 30))))

(define-fun in_range27 ((x Int)) Bool (and (<= 21 x) (<= x 30)))

(declare-fun attr__ATTRIBUTE_IMAGE30 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check30 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE30 (us_image) Int)

(declare-fun user_eq30 (t163b t163b) Bool)

(declare-const dummy30 t163b)

(declare-datatypes ((t163b__ref 0))
(((t163b__refqtmk (t163b__content t163b)))))
(define-fun t163b__ref_t163b__content__projection ((a t163b__ref)) t163b 
  (t163b__content a))

(declare-sort t166b 0)

(declare-fun t166bqtint (t166b) Int)

;; t166b'axiom
  (assert
  (forall ((i t166b)) (and (<= 31 (t166bqtint i)) (<= (t166bqtint i) 40))))

(define-fun in_range28 ((x Int)) Bool (and (<= 31 x) (<= x 40)))

(declare-fun attr__ATTRIBUTE_IMAGE31 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check31 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE31 (us_image) Int)

(declare-fun user_eq31 (t166b t166b) Bool)

(declare-const dummy31 t166b)

(declare-datatypes ((t166b__ref 0))
(((t166b__refqtmk (t166b__content t166b)))))
(define-fun t166b__ref_t166b__content__projection ((a t166b__ref)) t166b 
  (t166b__content a))

(declare-sort t168b 0)

(declare-fun t168bqtint (t168b) Int)

;; t168b'axiom
  (assert
  (forall ((i t168b)) (and (<= 31 (t168bqtint i)) (<= (t168bqtint i) 40))))

(define-fun in_range29 ((x Int)) Bool (and (<= 31 x) (<= x 40)))

(declare-fun attr__ATTRIBUTE_IMAGE32 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check32 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE32 (us_image) Int)

(declare-fun user_eq32 (t168b t168b) Bool)

(declare-const dummy32 t168b)

(declare-datatypes ((t168b__ref 0))
(((t168b__refqtmk (t168b__content t168b)))))
(define-fun t168b__ref_t168b__content__projection ((a t168b__ref)) t168b 
  (t168b__content a))

(declare-fun check_loop_inv__a__aggregate_def (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_199 (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_216 (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_233 (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_262 (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_279 (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_296 (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_313 (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_329 (Int Int Int) us_t)

(declare-fun temp_____aggregate_def_358 (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_375 (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_392 (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_409 (Int) (Array Int natural))

(declare-fun temp_____aggregate_def_426 (Int) (Array Int natural))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant3 ((temp___expr_182 us_t)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (=>
                                     (not (= temp___skip_constant_179 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_182)
                                     (last1 temp___expr_182))))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___185 Int))
  (=> (dynamic_invariant1 temp___185 true true true true)
  (forall ((temp___186 Int))
  (= (select (check_loop_inv__a__aggregate_def temp___185) temp___186) 
  rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___201 Int))
  (=> (dynamic_invariant1 temp___201 true true true true)
  (forall ((temp___202 Int))
  (= (select (temp_____aggregate_def_199 temp___201) temp___202) rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___218 Int))
  (=> (dynamic_invariant1 temp___218 true true true true)
  (forall ((temp___219 Int))
  (= (select (temp_____aggregate_def_216 temp___218) temp___219) rliteral)))))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 1))

;; def_axiom
  (assert
  (forall ((temp___235 Int))
  (=> (dynamic_invariant1 temp___235 true true true true)
  (forall ((temp___236 Int))
  (= (select (temp_____aggregate_def_233 temp___235) temp___236) rliteral1)))))

;; def_axiom
  (assert
  (forall ((temp___264 Int))
  (=> (dynamic_invariant1 temp___264 true true true true)
  (forall ((temp___265 Int))
  (= (select (temp_____aggregate_def_262 temp___264) temp___265) rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___281 Int))
  (=> (dynamic_invariant1 temp___281 true true true true)
  (forall ((temp___282 Int))
  (= (select (temp_____aggregate_def_279 temp___281) temp___282) rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___298 Int))
  (=> (dynamic_invariant1 temp___298 true true true true)
  (forall ((temp___299 Int))
  (= (select (temp_____aggregate_def_296 temp___298) temp___299) rliteral1)))))

(declare-const rliteral2 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral2) 2))

;; def_axiom
  (assert
  (forall ((temp___315 Int))
  (=> (dynamic_invariant1 temp___315 true true true true)
  (forall ((temp___316 Int))
  (= (select (temp_____aggregate_def_313 temp___315) temp___316) rliteral2)))))

(declare-const rliteral3 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral3) 3))

;; def_axiom
  (assert
  (forall ((temp___331 Int) (temp___332 Int) (temp___333 Int))
  (let ((temp___330 (temp_____aggregate_def_329 temp___331 temp___332
                    temp___333)))
  (=> (dynamic_invariant1 temp___331 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___332 temp___333)
  (and (= (first1 temp___330) temp___332) (= (last1 temp___330) temp___333)))
  (forall ((temp___334 Int))
  (= (select (to_array temp___330) temp___334) rliteral3)))))))

;; def_axiom
  (assert
  (forall ((temp___360 Int))
  (=> (dynamic_invariant1 temp___360 true true true true)
  (forall ((temp___361 Int))
  (= (select (temp_____aggregate_def_358 temp___360) temp___361) rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___377 Int))
  (=> (dynamic_invariant1 temp___377 true true true true)
  (forall ((temp___378 Int))
  (= (select (temp_____aggregate_def_375 temp___377) temp___378) rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___394 Int))
  (=> (dynamic_invariant1 temp___394 true true true true)
  (forall ((temp___395 Int))
  (= (select (temp_____aggregate_def_392 temp___394) temp___395) rliteral1)))))

;; def_axiom
  (assert
  (forall ((temp___411 Int))
  (=> (dynamic_invariant1 temp___411 true true true true)
  (forall ((temp___412 Int))
  (= (select (temp_____aggregate_def_409 temp___411) temp___412) rliteral2)))))

;; def_axiom
  (assert
  (forall ((temp___428 Int))
  (=> (dynamic_invariant1 temp___428 true true true true)
  (forall ((temp___429 Int))
  (= (select (temp_____aggregate_def_426 temp___428) temp___429) rliteral3)))))

(assert
;; defqtvc
 ;; File "check_loop_inv.adb", line 1, characters 0-0
  (not
  (forall ((v Int))
  (=> (= v 20)
  (=> (dynamic_invariant v true false true true)
  (let ((check_loop_inv__a__assume (of_array
                                   (check_loop_inv__a__aggregate_def 0) 1
                                   100)))
  (forall ((a (Array Int natural)))
  (=> (= a (to_array check_loop_inv__a__assume))
  (=> (= (to_rep a__first) (first1 check_loop_inv__a__assume))
  (=> (= (to_rep a__last) (last1 check_loop_inv__a__assume))
  (=> (dynamic_property 1 2147483647 (to_rep a__first) (to_rep a__last))
  (let ((check_loop_inv__L_1__R6b__assume (get_v v)))
  (=>
  (and (get_v__function_guard check_loop_inv__L_1__R6b__assume v)
  (and (dynamic_invariant check_loop_inv__L_1__R6b__assume true false true
  true) (= check_loop_inv__L_1__R6b__assume v)))
  (=> (= check_loop_inv__L_1__R6b__assume r6b)
  (=> (dynamic_invariant r6b true false true true)
  (forall ((a1 (Array Int natural)))
  (=>
  (let ((temp___189 r6b))
  (exists ((i Int))
  (and (= i 11)
  (ite (= (and (ite (<= 11 i) true false) (ite (<= i temp___189) true false)) true)
  (exists ((v1 Int) (a2 (Array Int natural)) (i1 Int))
  (and
  (= (and (ite (and
               (and (dynamic_property1 11 r6b i1) (dynamic_invariant v1 true
               true true true))
               (forall ((temp___194 Int))
               (=>
               (and (<= (to_rep a__first) temp___194)
               (<= temp___194 (to_rep a__last)))
               (=>
               (or (< temp___189 temp___194)
               (or (< temp___194 11) (<= i1 temp___194)))
               (= (select a2 temp___194) (select a temp___194))))))
          true false) (ite (and (<= 11 i1) (<= i1 r6b)) true false)) true)
  (and (and (<= (to_rep a__first) i1) (<= i1 (to_rep a__last)))
  (and (= a1 (store a2 i1 rliteral1)) (= i1 temp___189))))) (= a1 a)))))
  (= (bool_eq a1 1 10 (temp_____aggregate_def_199 0) 1 10) true))))))))))))))))))
(check-sat)
(exit)
