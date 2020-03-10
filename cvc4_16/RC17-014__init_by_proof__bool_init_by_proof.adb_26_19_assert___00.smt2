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

(declare-sort my_bool 0)

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (my_bool my_bool) Bool)

(declare-const dummy my_bool)

(declare-datatypes ((my_bool__ref 0))
(((my_bool__refqtmk (my_bool__content my_bool)))))
(define-fun my_bool__ref_my_bool__content__projection ((a my_bool__ref)) my_bool 
  (my_bool__content a))

(declare-datatypes ((my_bool__init_wrapper 0))
(((my_bool__init_wrapperqtmk (rec__value my_bool)(attr__init Bool)))))
(define-fun my_bool__init_wrapper_rec__value__projection ((a my_bool__init_wrapper)) my_bool 
  (rec__value a))

(define-fun my_bool__init_wrapper_attr__init__projection ((a my_bool__init_wrapper)) Bool 
  (attr__init a))

(declare-fun to_rep (my_bool) Int)

(declare-fun of_rep (Int) my_bool)

;; inversion_axiom
  (assert
  (forall ((x my_bool)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x my_bool)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int my_bool__init_wrapper))))))
(declare-fun slide ((Array Int my_bool__init_wrapper) Int
  Int) (Array Int my_bool__init_wrapper))

;; slide_eq
  (assert
  (forall ((a (Array Int my_bool__init_wrapper)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int my_bool__init_wrapper)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int my_bool__init_wrapper)) (a__first Int)
  (a__last Int) (b (Array Int my_bool__init_wrapper)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (rec__value (select a temp___idx_154))) 
                           (to_rep
                           (rec__value
                           (select b (+ (- b__first a__first) temp___idx_154))))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int my_bool__init_wrapper))
  (b (Array Int my_bool__init_wrapper)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (rec__value (select a temp___idx_154))) (to_rep
                                                     (rec__value
                                                     (select b (+ (- b__first a__first) temp___idx_154))))))))))))

(declare-sort color 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (color color) Bool)

(declare-const dummy1 color)

(declare-datatypes ((color__ref 0))
(((color__refqtmk (color__content color)))))
(define-fun color__ref_color__content__projection ((a color__ref)) color 
  (color__content a))

(define-fun default_initial_assumption ((temp___expr_197 (Array Int my_bool__init_wrapper))
  (temp___skip_top_level_198 Bool)) Bool (forall ((temp___199 Int))
                                         (=>
                                         (and (<= 0 temp___199)
                                         (<= temp___199 2))
                                         (= (attr__init
                                            (select temp___expr_197 temp___199)) false))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((color__init_wrapper 0))
(((color__init_wrapperqtmk (rec__value1 color)(attr__init1 Bool)))))
(define-fun color__init_wrapper_rec__value__projection ((a color__init_wrapper)) color 
  (rec__value1 a))

(define-fun color__init_wrapper_attr__init__projection ((a color__init_wrapper)) Bool 
  (attr__init1 a))

(declare-fun to_rep1 (color) Int)

(declare-fun of_rep1 (Int) color)

;; inversion_axiom
  (assert
  (forall ((x color))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x color)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int color__init_wrapper))))))
(declare-fun slide1 ((Array Int color__init_wrapper) Int
  Int) (Array Int color__init_wrapper))

;; slide_eq
  (assert
  (forall ((a (Array Int color__init_wrapper)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int color__init_wrapper)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int color__init_wrapper)) (a__first Int)
  (a__last Int) (b (Array Int color__init_wrapper)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep1
                              (rec__value1 (select a temp___idx_155))) 
                           (to_rep1
                           (rec__value1
                           (select b (+ (- b__first a__first) temp___idx_155))))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int color__init_wrapper))
  (b (Array Int color__init_wrapper)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep1 (rec__value1 (select a temp___idx_155))) (to_rep1
                                                       (rec__value1
                                                       (select b (+ (- b__first a__first) temp___idx_155))))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun get ((a (Array Int my_bool__init_wrapper))
  (i Int)) my_bool (rec__value (select a i)))

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Bool)

(define-fun to_bool ((x my_bool)) Bool (distinct (to_rep x) 0))

(define-fun of_bool ((x Bool)) my_bool (of_rep (ite x 1 0)))

(declare-fun xorb ((Array Int my_bool__init_wrapper) Int Int
  (Array Int my_bool__init_wrapper) Int
  Int) (Array Int my_bool__init_wrapper))

(declare-fun andb ((Array Int my_bool__init_wrapper) Int Int
  (Array Int my_bool__init_wrapper) Int
  Int) (Array Int my_bool__init_wrapper))

(declare-fun orb ((Array Int my_bool__init_wrapper) Int Int
  (Array Int my_bool__init_wrapper) Int
  Int) (Array Int my_bool__init_wrapper))

(declare-fun notb ((Array Int my_bool__init_wrapper) Int
  Int) (Array Int my_bool__init_wrapper))

;; op_def
  (assert
  (forall ((a (Array Int my_bool__init_wrapper))
  (b (Array Int my_bool__init_wrapper)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (=> (and (<= a_first i) (<= i a_last))
     (= (get (orb a a_first a_last b b_first b_last) i) (of_bool
                                                        (or (to_bool
                                                            (get a i)) 
                                                        (to_bool
                                                        (get b
                                                        (+ (- i a_first) b_first))))))) :pattern (
  (get (orb a a_first a_last b b_first b_last) i)) )))))

;; op_def
  (assert
  (forall ((a (Array Int my_bool__init_wrapper))
  (b (Array Int my_bool__init_wrapper)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (=> (and (<= a_first i) (<= i a_last))
     (= (get (andb a a_first a_last b b_first b_last) i) (of_bool
                                                         (and (to_bool
                                                              (get a i)) 
                                                         (to_bool
                                                         (get b
                                                         (+ (- i a_first) b_first))))))) :pattern (
  (get (andb a a_first a_last b b_first b_last) i)) )))))

;; op_def
  (assert
  (forall ((a (Array Int my_bool__init_wrapper))
  (b (Array Int my_bool__init_wrapper)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (=> (and (<= a_first i) (<= i a_last))
     (= (get (xorb a a_first a_last b b_first b_last) i) (of_bool
                                                         (xor (to_bool
                                                              (get a i)) 
                                                         (to_bool
                                                         (get b
                                                         (+ (- i a_first) b_first))))))) :pattern (
  (get (xorb a a_first a_last b b_first b_last) i)) )))))

;; notb_def
  (assert
  (forall ((a (Array Int my_bool__init_wrapper)))
  (forall ((a_first Int) (a_last Int))
  (forall ((i Int))
  (! (=> (and (<= a_first i) (<= i a_last))
     (= (get (notb a a_first a_last) i) (of_bool (not (to_bool (get a i)))))) :pattern (
  (get (notb a a_first a_last) i)) )))))

(define-fun default_initial_assumption1 ((temp___expr_207 (Array Int color__init_wrapper))
  (temp___skip_top_level_208 Bool)) Bool (forall ((temp___209 Int))
                                         (=>
                                         (and (<= 0 temp___209)
                                         (<= temp___209 1))
                                         (= (attr__init1
                                            (select temp___expr_207 temp___209)) false))))

(declare-fun temp_____aggregate_def_221 (Int) (Array Int my_bool__init_wrapper))

(define-fun dynamic_invariant ((temp___expr_181 Int)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (or (= temp___is_init_177 true)
                                     (<= 0 1)) (in_range temp___expr_181)))

(define-fun dynamic_invariant1 ((temp___expr_188 Int)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (=>
                                     (or (= temp___is_init_184 true)
                                     (<= 0 2)) (in_range1 temp___expr_188)))

;; def_axiom
  (assert
  (forall ((temp___223 Int))
  (let ((temp___222 (temp_____aggregate_def_221 temp___223)))
  (=> (dynamic_invariant temp___223 true true true true)
  (forall ((temp___224 Int))
  (and (= (to_rep (rec__value (select temp___222 temp___224))) temp___223)
  (= (attr__init (select temp___222 temp___224)) true)))))))

(assert
;; defqtvc
 ;; File "bool_init_by_proof.adb", line 1, characters 0-0
  (not
  (forall ((x (Array Int my_bool__init_wrapper))
  (y (Array Int my_bool__init_wrapper)) (c (Array Int color__init_wrapper))
  (o color) (c1 (Array Int color__init_wrapper)) (o1 color)
  (c2 (Array Int color__init_wrapper)) (temp___219 Int))
  (=> (default_initial_assumption x false)
  (=> (default_initial_assumption y false)
  (=> (default_initial_assumption1 c false)
  (=> (= (to_rep1 o) 2)
  (=> (= c1 (store c 1 (color__init_wrapperqtmk o true)))
  (=> (= (to_rep1 o1) 0)
  (=> (= c2 (store c1 0 (color__init_wrapperqtmk o1 true)))
  (=> (<= 0 temp___219)
  (=> (<= temp___219 1) (= (attr__init1 (select c2 temp___219)) true)))))))))))))
(check-sat)
(exit)
