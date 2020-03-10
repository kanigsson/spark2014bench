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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

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
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort small_nat 0)

(declare-fun small_natqtint (small_nat) Int)

;; small_nat'axiom
  (assert
  (forall ((i small_nat))
  (and (<= 0 (small_natqtint i)) (<= (small_natqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (small_nat small_nat) Bool)

(declare-const dummy1 small_nat)

(declare-datatypes ((small_nat__ref 0))
(((small_nat__refqtmk (small_nat__content small_nat)))))
(define-fun small_nat__ref_small_nat__content__projection ((a small_nat__ref)) small_nat 
  (small_nat__content a))

(declare-sort small_pos 0)

(declare-fun small_posqtint (small_pos) Int)

;; small_pos'axiom
  (assert
  (forall ((i small_pos))
  (and (<= 1 (small_posqtint i)) (<= (small_posqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (small_pos small_pos) Bool)

(declare-const dummy2 small_pos)

(declare-datatypes ((small_pos__ref 0))
(((small_pos__refqtmk (small_pos__content small_pos)))))
(define-fun small_pos__ref_small_pos__content__projection ((a small_pos__ref)) small_pos 
  (small_pos__content a))

(define-fun to_rep1 ((x small_nat)) Int (small_natqtint x))

(declare-fun of_rep1 (Int) small_nat)

;; inversion_axiom
  (assert
  (forall ((x small_nat))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x small_nat)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int small_nat))))))
(declare-fun slide ((Array Int small_nat) Int Int) (Array Int small_nat))

;; slide_eq
  (assert
  (forall ((a (Array Int small_nat)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int small_nat)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int small_nat)) (a__first Int) (a__last Int)
  (b (Array Int small_nat)) (b__first Int)
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
  (forall ((a (Array Int small_nat)) (b (Array Int small_nat)))
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
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int small_nat))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int small_nat) (elts a))

(define-fun of_array ((a (Array Int small_nat)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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

(declare-datatypes ((my_arr__ref 0))
(((my_arr__refqtmk (my_arr__content us_t)))))
(define-fun my_arr__ref_my_arr__content__projection ((a my_arr__ref)) us_t 
  (my_arr__content a))

(declare-fun sum (us_t) Int)

(declare-fun sum__function_guard (Int us_t) Bool)

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

(declare-fun user_eq4 (natural natural) Bool)

(declare-const dummy4 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range3
                                    temp___expr_39)))

(define-fun dynamic_invariant1 ((temp___expr_196 us_t)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (=>
                                     (not (= temp___skip_constant_193 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_196)
                                     (last1 temp___expr_196))))

(declare-datatypes ((t37b__ref 0))
(((t37b__refqtmk (t37b__content us_t)))))
(define-fun t37b__ref_t37b__content__projection ((a t37b__ref)) us_t 
  (t37b__content a))

;; sum__def_axiom
  (assert
  (forall ((m us_t))
  (! (=>
     (and (dynamic_invariant1 m true true true true) (sum__function_guard
     (sum m) m))
     (and
     (forall ((m1 us_t)) (sum__function_guard
     (sum
     (let ((temp___204 (let ((temp___203 (- (last1 m1) 1)))
                       (let ((temp___202 (first1 m1)))
                       (of_array (to_array m1) temp___202 temp___203)))))
     (of_array (to_array temp___204) (first1 temp___204) (last1 temp___204))))
     (let ((temp___204 (let ((temp___203 (- (last1 m1) 1)))
                       (let ((temp___202 (first1 m1)))
                       (of_array (to_array m1) temp___202 temp___203)))))
     (of_array (to_array temp___204) (first1 temp___204) (last1 temp___204)))))
     (= (sum m) (ite (= (length1 m) 0) 0
                (+ (sum
                   (let ((temp___204 (let ((temp___203 (- (last1 m) 1)))
                                     (let ((temp___202 (first1 m)))
                                     (of_array (to_array m) temp___202
                                     temp___203)))))
                   (of_array (to_array temp___204) (first1 temp___204)
                   (last1 temp___204)))) (to_rep1
                                         (select (to_array m) (last1 m)))))))) :pattern (
  (sum m)) )))

(declare-fun id (us_t) us_t)

(declare-fun id__function_guard (us_t us_t) Bool)

;; id__post_axiom
  (assert
  (forall ((x us_t))
  (! (=> (dynamic_invariant1 x true true true true)
     (let ((result (id x)))
     (=> (id__function_guard result x) (dynamic_invariant1 result true false
     true true)))) :pattern ((id x)) )))

(declare-const x__first integer)

(declare-const x__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const m__first integer)

(declare-const m__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort t32b 0)

(declare-fun t32bqtint (t32b) Int)

;; t32b'axiom
  (assert
  (forall ((i t32b)) (and (<= 1 (t32bqtint i)) (<= (t32bqtint i) 3))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (t32b t32b) Bool)

(declare-const dummy5 t32b)

(declare-datatypes ((t32b__ref 0))
(((t32b__refqtmk (t32b__content t32b)))))
(define-fun t32b__ref_t32b__content__projection ((a t32b__ref)) t32b 
  (t32b__content a))

(declare-fun test_rec__x__aggregate_def (Int Int Int) (Array Int small_nat))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_182 Int)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (=>
                                     (or (= temp___is_init_178 true)
                                     (<= 0 100)) (in_range1 temp___expr_182)))

(define-fun dynamic_invariant4 ((temp___expr_189 Int)
  (temp___is_init_185 Bool) (temp___skip_constant_186 Bool)
  (temp___do_toplevel_187 Bool)
  (temp___do_typ_inv_188 Bool)) Bool (=>
                                     (or (= temp___is_init_185 true)
                                     (<= 1 100)) (in_range2 temp___expr_189)))

;; sum__post_axiom
  (assert
  (forall ((m us_t))
  (! (=> (dynamic_invariant1 m true true true true)
     (let ((result (sum m)))
     (=> (sum__function_guard result m)
     (and (<= result (* 100 (length1 m))) (dynamic_invariant result true
     false true true))))) :pattern ((sum m)) )))

(declare-const rliteral small_nat)

;; rliteral_axiom
  (assert (= (small_natqtint rliteral) 1))

(declare-const rliteral1 small_nat)

;; rliteral_axiom
  (assert (= (small_natqtint rliteral1) 2))

(declare-const rliteral2 small_nat)

;; rliteral_axiom
  (assert (= (small_natqtint rliteral2) 3))

;; def_axiom
  (assert
  (forall ((temp___253 Int) (temp___254 Int) (temp___255 Int))
  (let ((temp___252 (test_rec__x__aggregate_def temp___253 temp___254
                    temp___255)))
  (=>
  (and
  (and (dynamic_invariant3 temp___253 true true true true)
  (dynamic_invariant3 temp___254 true true true true)) (dynamic_invariant3
  temp___255 true true true true))
  (and
  (and (= (select temp___252 1) rliteral)
  (= (select temp___252 2) rliteral1)) (= (select temp___252 3) rliteral2))))))

(assert
;; defqtvc
 ;; File "test_rec.adb", line 1, characters 0-0
  (not
  (let ((test_rec__x__assume (of_array (test_rec__x__aggregate_def 1 2 3) 1
                             3)))
  (forall ((x (Array Int small_nat)))
  (=> (= x (to_array test_rec__x__assume))
  (=> (= (to_rep x__first) (first1 test_rec__x__assume))
  (=> (= (to_rep x__last) (last1 test_rec__x__assume))
  (=> (dynamic_property 1 100 (to_rep x__first) (to_rep x__last))
  (forall ((o Int))
  (=> (= (to_rep x__last) o)
  (forall ((o1 Int))
  (=> (= (to_rep x__first) o1)
  (let ((o2 (of_array x o1 o)))
  (let ((test_rec__m__assume (id o2)))
  (=>
  (and (id__function_guard test_rec__m__assume o2) (dynamic_invariant1
  test_rec__m__assume true false true true))
  (forall ((m (Array Int small_nat)))
  (=> (= m (to_array test_rec__m__assume))
  (=> (= (to_rep m__first) (first1 test_rec__m__assume))
  (=> (= (to_rep m__last) (last1 test_rec__m__assume))
  (=> (dynamic_property 1 100 (to_rep m__first) (to_rep m__last))
  (=>
  (forall ((x1 (Array Int small_nat))) (sum__function_guard
  (sum (of_array x1 (to_rep x__first) (to_rep x__last)))
  (of_array x1 (to_rep x__first) (to_rep x__last))))
  (<= (sum (of_array x (to_rep x__first) (to_rep x__last))) 300))))))))))))))))))))))
(check-sat)
(exit)
