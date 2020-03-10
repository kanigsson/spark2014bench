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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

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

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const b1 Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const b2 Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range3 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (natural natural) Bool)

(declare-const dummy2 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep1 ((x1 natural)) Int (naturalqtint x1))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x1 natural))
  (! (= (of_rep1 (to_rep1 x1)) x1) :pattern ((to_rep1 x1)) )))

;; range_axiom
  (assert
  (forall ((x1 natural)) (! (in_range3
  (to_rep1 x1)) :pattern ((to_rep1 x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (in_range3 x1) (= (to_rep1 (of_rep1 x1)) x1)) :pattern ((to_rep1
                                                                 (of_rep1 x1))) )))

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

(declare-const v__first integer)

(declare-const v__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const u__first integer)

(declare-const u__last integer)

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

(define-fun bool_eq1 ((x1 us_t)
  (y1 us_t)) Bool (bool_eq (elts x1) (to_rep (first (rt x1)))
                  (to_rep (last (rt x1))) (elts y1) (to_rep (first (rt y1)))
                  (to_rep (last (rt y1)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((my_array__ref 0))
(((my_array__refqtmk (my_array__content us_t)))))
(define-fun my_array__ref_my_array__content__projection ((a my_array__ref)) us_t 
  (my_array__content a))

(declare-datatypes ((constr_arr__ref 0))
(((constr_arr__refqtmk (constr_arr__content us_t)))))
(define-fun constr_arr__ref_constr_arr__content__projection ((a constr_arr__ref)) us_t 
  (constr_arr__content a))

(declare-datatypes ((constr_arr_2__ref 0))
(((constr_arr_2__refqtmk (constr_arr_2__content us_t)))))
(define-fun constr_arr_2__ref_constr_arr_2__content__projection ((a constr_arr_2__ref)) us_t 
  (constr_arr_2__content a))

(declare-datatypes ((t21b__ref 0))
(((t21b__refqtmk (t21b__content us_t)))))
(define-fun t21b__ref_t21b__content__projection ((a t21b__ref)) us_t 
  (t21b__content a))

(declare-datatypes ((t23b__ref 0))
(((t23b__refqtmk (t23b__content us_t)))))
(define-fun t23b__ref_t23b__content__projection ((a t23b__ref)) us_t 
  (t23b__content a))

(declare-datatypes ((t27b__ref 0))
(((t27b__refqtmk (t27b__content us_t)))))
(define-fun t27b__ref_t27b__content__projection ((a t27b__ref)) us_t 
  (t27b__content a))

(declare-datatypes ((t31b__ref 0))
(((t31b__refqtmk (t31b__content us_t)))))
(define-fun t31b__ref_t31b__content__projection ((a t31b__ref)) us_t 
  (t31b__content a))

(declare-datatypes ((t35b__ref 0))
(((t35b__refqtmk (t35b__content us_t)))))
(define-fun t35b__ref_t35b__content__projection ((a t35b__ref)) us_t 
  (t35b__content a))

(declare-fun formals_arr_split__v__aggregate_def (Int Int Int) us_t)

(declare-fun formals_arr_split__u__aggregate_def (Int Int Int) us_t)

(declare-fun temp_____aggregate_def_233 (Int Int Int) us_t)

(declare-fun temp_____aggregate_def_242 (Int Int Int) us_t)

(declare-fun temp_____aggregate_def_255 (Int Int Int) us_t)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range3
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_159 us_t)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (not (= temp___skip_constant_156 true))
                                     (dynamic_property (- 2147483648)
                                     2147483647 (first1 temp___expr_159)
                                     (last1 temp___expr_159))))

(define-fun dynamic_invariant4 ((temp___expr_165 us_t)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (not (= temp___skip_constant_162 true))
                                     (and (dynamic_property 0 x
                                     (first1 temp___expr_165)
                                     (last1 temp___expr_165))
                                     (and (= (first1 temp___expr_165) 0)
                                     (= (last1 temp___expr_165) x)))))

(define-fun default_initial_assumption ((temp___expr_167 us_t)
  (temp___skip_top_level_168 Bool)) Bool (and (= (first1 temp___expr_167) 0)
                                         (= (last1 temp___expr_167) x)))

(define-fun dynamic_invariant5 ((temp___expr_175 us_t)
  (temp___is_init_171 Bool) (temp___skip_constant_172 Bool)
  (temp___do_toplevel_173 Bool)
  (temp___do_typ_inv_174 Bool)) Bool (=>
                                     (not (= temp___skip_constant_172 true))
                                     (and (dynamic_property 0 y
                                     (first1 temp___expr_175)
                                     (last1 temp___expr_175))
                                     (and (= (first1 temp___expr_175) 0)
                                     (= (last1 temp___expr_175) y)))))

(define-fun default_initial_assumption1 ((temp___expr_177 us_t)
  (temp___skip_top_level_178 Bool)) Bool (and (= (first1 temp___expr_177) 0)
                                         (= (last1 temp___expr_177) y)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 1))

;; def_axiom
  (assert
  (forall ((temp___218 Int) (temp___219 Int) (temp___220 Int))
  (let ((temp___217 (formals_arr_split__v__aggregate_def temp___218
                    temp___219 temp___220)))
  (=> (dynamic_invariant2 temp___218 true true true true)
  (and
  (=> (dynamic_property (- 2147483648) 2147483647 temp___219 temp___220)
  (and (= (first1 temp___217) temp___219) (= (last1 temp___217) temp___220)))
  (forall ((temp___221 Int))
  (= (select (to_array temp___217) temp___221) rliteral)))))))

;; def_axiom
  (assert
  (forall ((temp___226 Int) (temp___227 Int) (temp___228 Int))
  (let ((temp___225 (formals_arr_split__u__aggregate_def temp___226
                    temp___227 temp___228)))
  (=> (dynamic_invariant2 temp___226 true true true true)
  (and
  (=> (dynamic_property (- 2147483648) 2147483647 temp___227 temp___228)
  (and (= (first1 temp___225) temp___227) (= (last1 temp___225) temp___228)))
  (forall ((temp___229 Int))
  (= (select (to_array temp___225) temp___229) rliteral)))))))

;; def_axiom
  (assert
  (forall ((temp___235 Int) (temp___236 Int) (temp___237 Int))
  (let ((temp___234 (temp_____aggregate_def_233 temp___235 temp___236
                    temp___237)))
  (=> (dynamic_invariant2 temp___235 true true true true)
  (and
  (=> (dynamic_property (- 2147483648) 2147483647 temp___236 temp___237)
  (and (= (first1 temp___234) temp___236) (= (last1 temp___234) temp___237)))
  (forall ((temp___238 Int))
  (= (select (to_array temp___234) temp___238) rliteral)))))))

;; def_axiom
  (assert
  (forall ((temp___244 Int) (temp___245 Int) (temp___246 Int))
  (let ((temp___243 (temp_____aggregate_def_242 temp___244 temp___245
                    temp___246)))
  (=> (dynamic_invariant2 temp___244 true true true true)
  (and
  (=> (dynamic_property (- 2147483648) 2147483647 temp___245 temp___246)
  (and (= (first1 temp___243) temp___245) (= (last1 temp___243) temp___246)))
  (forall ((temp___247 Int))
  (= (select (to_array temp___243) temp___247) rliteral)))))))

;; def_axiom
  (assert
  (forall ((temp___257 Int) (temp___258 Int) (temp___259 Int))
  (let ((temp___256 (temp_____aggregate_def_255 temp___257 temp___258
                    temp___259)))
  (=> (dynamic_invariant2 temp___257 true true true true)
  (and
  (=> (dynamic_property (- 2147483648) 2147483647 temp___258 temp___259)
  (and (= (first1 temp___256) temp___258) (= (last1 temp___256) temp___259)))
  (forall ((temp___260 Int))
  (= (select (to_array temp___256) temp___260) rliteral)))))))

(assert
;; defqtvc
 ;; File "formals_arr_split.adb", line 1, characters 0-0
  (not
  (=> (dynamic_invariant x true false true true)
  (=> (dynamic_invariant y true false true true)
  (let ((temp___222 (formals_arr_split__v__aggregate_def 1 0 x)))
  (=> (= (first1 temp___222) 0)
  (=> (= (last1 temp___222) x)
  (=>
  (ite (<= (first1 temp___222) (last1 temp___222))
  (and (<= 0 x) (= (- (last1 temp___222) (first1 temp___222)) (- x 0)))
  (< x 0))
  (let ((formals_arr_split__v__assume (of_array (to_array temp___222)
                                      (first1 temp___222) (last1 temp___222))))
  (forall ((v (Array Int natural)))
  (=> (= v (to_array formals_arr_split__v__assume))
  (=> (= (to_rep v__first) (first1 formals_arr_split__v__assume))
  (=> (= (to_rep v__last) (last1 formals_arr_split__v__assume))
  (=>
  (and (dynamic_property 0 x (to_rep v__first) (to_rep v__last))
  (and (= (to_rep v__first) 0) (= (to_rep v__last) x)))
  (let ((temp___230 (formals_arr_split__u__aggregate_def 1 0 y)))
  (=> (= (first1 temp___230) 0)
  (=> (= (last1 temp___230) y)
  (=>
  (ite (<= (first1 temp___230) (last1 temp___230))
  (and (<= 0 y) (= (- (last1 temp___230) (first1 temp___230)) (- y 0)))
  (< y 0))
  (let ((formals_arr_split__u__assume (of_array (to_array temp___230)
                                      (first1 temp___230) (last1 temp___230))))
  (forall ((u (Array Int natural)))
  (=> (= u (to_array formals_arr_split__u__assume))
  (=> (= (to_rep u__first) (first1 formals_arr_split__u__assume))
  (=> (= (to_rep u__last) (last1 formals_arr_split__u__assume))
  (=>
  (and (dynamic_property 0 y (to_rep u__first) (to_rep u__last))
  (and (= (to_rep u__first) 0) (= (to_rep u__last) y)))
  (let ((temp___239 (temp_____aggregate_def_233 1 0 y)))
  (=> (= (first1 temp___239) 0)
  (=> (= (last1 temp___239) y)
  (=>
  (ite (<= (first1 temp___239) (last1 temp___239))
  (and (<= 0 y) (= (- (last1 temp___239) (first1 temp___239)) (- y 0)))
  (< y 0))
  (let ((temp___241 (of_array (to_array temp___239) (first1 temp___239)
                    (last1 temp___239))))
  (=>
  (ite (<= (first1 temp___241) (last1 temp___241))
  (and (<= (to_rep u__first) (to_rep u__last))
  (= (- (last1 temp___241) (first1 temp___241)) (- (to_rep u__last) (to_rep
                                                                    u__first))))
  (< (to_rep u__last) (to_rep u__first)))
  (forall ((u1 (Array Int natural)))
  (=> (= u1 (to_array temp___241))
  (forall ((spark__branch Bool))
  (=> (= spark__branch b1)
  (=> (= spark__branch true)
  (forall ((spark__branch1 Bool))
  (=> (= spark__branch1 b2)
  (=> (= spark__branch1 true)
  (=> (<= (to_rep u__first) (to_rep u__last)) (<= 0 x))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
