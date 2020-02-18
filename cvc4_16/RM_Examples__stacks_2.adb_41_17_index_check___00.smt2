;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-fun is_empty (Int) Bool)

(declare-fun is_empty__function_guard (Bool Int) Bool)

(declare-fun is_empty1 (Int) Bool)

(declare-fun is_empty__function_guard1 (Bool Int) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort pointer_type 0)

(declare-fun pointer_typeqtint (pointer_type) Int)

;; pointer_type'axiom
  (assert
  (forall ((i pointer_type))
  (and (<= 0 (pointer_typeqtint i)) (<= (pointer_typeqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (pointer_type pointer_type) Bool)

(declare-const dummy1 pointer_type)

(declare-datatypes ((pointer_type__ref 0))
(((pointer_type__refqtmk (pointer_type__content pointer_type)))))
(define-fun pointer_type__ref_pointer_type__content__projection ((a pointer_type__ref)) pointer_type 
  (pointer_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 0 100)) (in_range2 temp___expr_168)))

;; is_empty__post_axiom
  (assert true)

;; is_empty__post_refine_axiom
  (assert
  (forall ((stacks_2__a_pointer Int))
  (! (=> (dynamic_invariant1 stacks_2__a_pointer true true true true)
     (let ((result (is_empty1 stacks_2__a_pointer)))
     (=> (is_empty__function_guard1 result stacks_2__a_pointer)
     (= (= result true) (= stacks_2__a_pointer 0))))) :pattern ((is_empty1
                                                                stacks_2__a_pointer)) )))

(declare-fun is_full (Int) Bool)

(declare-fun is_full__function_guard (Bool Int) Bool)

(declare-fun is_full1 (Int) Bool)

(declare-fun is_full__function_guard1 (Bool Int) Bool)

;; is_full__post_axiom
  (assert true)

;; is_full__post_refine_axiom
  (assert
  (forall ((stacks_2__a_pointer Int))
  (! (=> (dynamic_invariant1 stacks_2__a_pointer true true true true)
     (let ((result (is_full1 stacks_2__a_pointer)))
     (=> (is_full__function_guard1 result stacks_2__a_pointer)
     (= (= result true) (= stacks_2__a_pointer 100))))) :pattern ((is_full1
                                                                  stacks_2__a_pointer)) )))

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i1 Int))
  (! (= (select (slide a old_first new_first) i1) (select a (- i1 (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i1)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (to_rep (select a temp___idx_156)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_156)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (to_rep (select a temp___idx_156)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_156)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort stack_index 0)

(declare-fun stack_indexqtint (stack_index) Int)

;; stack_index'axiom
  (assert
  (forall ((i1 stack_index))
  (and (<= 1 (stack_indexqtint i1)) (<= (stack_indexqtint i1) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (stack_index stack_index) Bool)

(declare-const dummy2 stack_index)

(declare-datatypes ((stack_index__ref 0))
(((stack_index__refqtmk (stack_index__content stack_index)))))
(define-fun stack_index__ref_stack_index__content__projection ((a stack_index__ref)) stack_index 
  (stack_index__content a))

(define-fun dynamic_invariant2 ((temp___expr_175 Int)
  (temp___is_init_171 Bool) (temp___skip_constant_172 Bool)
  (temp___do_toplevel_173 Bool)
  (temp___do_typ_inv_174 Bool)) Bool (=>
                                     (or (= temp___is_init_171 true)
                                     (<= 1 100)) (in_range3 temp___expr_175)))

(assert
;; defqtvc
 ;; File "stacks_2.ads", line 14, characters 0-0
  (not
  (forall ((a_pointer Int))
  (=> (dynamic_invariant1 a_pointer true false true true)
  (=> (dynamic_invariant i true false true true)
  (=>
  (forall ((a_pointer1 Int)) (is_full__function_guard1 (is_full1 a_pointer1)
  a_pointer1))
  (=> (not (= (is_full1 a_pointer) true))
  (let ((o (+ a_pointer 1)))
  (=> (in_range2 o)
  (forall ((a_pointer1 Int))
  (=> (= a_pointer1 o)
  (forall ((o1 integer)) (=> (= (to_rep o1) i) (<= 1 a_pointer1))))))))))))))
(check-sat)