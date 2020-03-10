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

(declare-sort pointer_range 0)

(declare-fun pointer_rangeqtint (pointer_range) Int)

;; pointer_range'axiom
  (assert
  (forall ((i pointer_range))
  (and (<= 0 (pointer_rangeqtint i)) (<= (pointer_rangeqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (pointer_range pointer_range) Bool)

(declare-const dummy2 pointer_range)

(declare-datatypes ((pointer_range__ref 0))
(((pointer_range__refqtmk (pointer_range__content pointer_range)))))
(define-fun pointer_range__ref_pointer_range__content__projection ((a pointer_range__ref)) pointer_range 
  (pointer_range__content a))

(define-fun to_rep1 ((x pointer_range)) Int (pointer_rangeqtint x))

(declare-fun of_rep1 (Int) pointer_range)

;; inversion_axiom
  (assert
  (forall ((x pointer_range))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x pointer_range)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

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
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
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
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy3 (Array Int integer))

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

(declare-fun user_eq3 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__stack_functional_spec__stack_type__s (Array Int integer))(rec__stack_functional_spec__stack_type__pointer pointer_range)))))
(define-fun us_split_fields_rec__stack_functional_spec__stack_type__s__projection ((a us_split_fields)) (Array Int integer) 
  (rec__stack_functional_spec__stack_type__s a))

(define-fun us_split_fields_rec__stack_functional_spec__stack_type__pointer__projection ((a us_split_fields)) pointer_range 
  (rec__stack_functional_spec__stack_type__pointer a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (bool_eq
                           (rec__stack_functional_spec__stack_type__s
                           (us_split_fields1 a)) 1 100
                           (rec__stack_functional_spec__stack_type__s
                           (us_split_fields1 b)) 1 100) true)
                        (= (to_rep1
                           (rec__stack_functional_spec__stack_type__pointer
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__stack_functional_spec__stack_type__pointer
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const stack_functional_spec__stack_type__s__first__bit Int)

(declare-const stack_functional_spec__stack_type__s__last__bit Int)

(declare-const stack_functional_spec__stack_type__s__position Int)

;; stack_functional_spec__stack_type__s__first__bit_axiom
  (assert (<= 0 stack_functional_spec__stack_type__s__first__bit))

;; stack_functional_spec__stack_type__s__last__bit_axiom
  (assert
  (< stack_functional_spec__stack_type__s__first__bit stack_functional_spec__stack_type__s__last__bit))

;; stack_functional_spec__stack_type__s__position_axiom
  (assert (<= 0 stack_functional_spec__stack_type__s__position))

(declare-const stack_functional_spec__stack_type__pointer__first__bit Int)

(declare-const stack_functional_spec__stack_type__pointer__last__bit Int)

(declare-const stack_functional_spec__stack_type__pointer__position Int)

;; stack_functional_spec__stack_type__pointer__first__bit_axiom
  (assert (<= 0 stack_functional_spec__stack_type__pointer__first__bit))

;; stack_functional_spec__stack_type__pointer__last__bit_axiom
  (assert
  (< stack_functional_spec__stack_type__pointer__first__bit stack_functional_spec__stack_type__pointer__last__bit))

;; stack_functional_spec__stack_type__pointer__position_axiom
  (assert (<= 0 stack_functional_spec__stack_type__pointer__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((stack_type__ref 0))
(((stack_type__refqtmk (stack_type__content us_rep)))))
(define-fun stack_type__ref_stack_type__content__projection ((a stack_type__ref)) us_rep 
  (stack_type__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun state (us_split_fields) us_rep)

(declare-fun state__function_guard (us_rep us_split_fields) Bool)

;; state__post_axiom
  (assert true)

;; state__def_axiom
  (assert
  (forall ((stack_functional_spec__my_stack__fields us_split_fields))
  (! (= (state stack_functional_spec__my_stack__fields) (us_repqtmk
                                                        stack_functional_spec__my_stack__fields)) :pattern (
  (state stack_functional_spec__my_stack__fields)) )))

(declare-fun count (us_rep) Int)

(declare-fun count__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

;; count__post_axiom
  (assert
  (forall ((s us_rep))
  (! (let ((result (count s)))
     (=> (count__function_guard result s) (dynamic_invariant1 result true
     false true true))) :pattern ((count s)) )))

;; count__def_axiom
  (assert
  (forall ((s us_rep))
  (! (= (count s) (to_rep1
                  (rec__stack_functional_spec__stack_type__pointer
                  (us_split_fields1 s)))) :pattern ((count s)) )))

(declare-fun stack_entry (us_rep Int) Int)

(declare-fun stack_entry__function_guard (Int us_rep Int) Bool)

;; stack_entry__post_axiom
  (assert
  (forall ((s us_rep))
  (forall ((n Int))
  (! (and (forall ((s1 us_rep)) (count__function_guard (count s1) s1))
     (=>
     (and (dynamic_invariant1 n true true true true)
     (and (<= 1 n) (<= n (count s))))
     (let ((result (stack_entry s n)))
     (=> (stack_entry__function_guard result s n) (dynamic_invariant result
     true false true true))))) :pattern ((stack_entry s n)) ))))

;; stack_entry__def_axiom
  (assert
  (forall ((s us_rep))
  (forall ((n Int))
  (! (=> (dynamic_invariant1 n true true true true)
     (= (stack_entry s n) (to_rep
                          (let ((temp___218 (rec__stack_functional_spec__stack_type__s
                                            (us_split_fields1 s))))
                          (select temp___218 n))))) :pattern ((stack_entry s
                                                              n)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort index_range 0)

(declare-fun index_rangeqtint (index_range) Int)

;; index_range'axiom
  (assert
  (forall ((i index_range))
  (and (<= 1 (index_rangeqtint i)) (<= (index_rangeqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (index_range index_range) Bool)

(declare-const dummy5 index_range)

(declare-datatypes ((index_range__ref 0))
(((index_range__refqtmk (index_range__content index_range)))))
(define-fun index_range__ref_index_range__content__projection ((a index_range__ref)) index_range 
  (index_range__content a))

(define-fun dynamic_invariant2 ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 100)) (in_range3 temp___expr_169)))

(define-fun dynamic_invariant3 ((temp___expr_176 Int)
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (=>
                                     (or (= temp___is_init_172 true)
                                     (<= 1 100)) (in_range4 temp___expr_176)))

(assert
;; defqtvc
 ;; File "stack_functional_spec.ads", line 81, characters 0-0
  (not
  (forall ((my_stack__split_fields us_split_fields) (temp Int))
  (=>
  (forall ((my_stack__split_fields1 us_split_fields)) (state__function_guard
  (state my_stack__split_fields1) my_stack__split_fields1))
  (=>
  (forall ((my_stack__split_fields1 us_split_fields)) (state__function_guard
  (state my_stack__split_fields1) my_stack__split_fields1))
  (=>
  (forall ((my_stack__split_fields1 us_split_fields)) (count__function_guard
  (count (state my_stack__split_fields1)) (state my_stack__split_fields1)))
  (=> (<= 2 (count (state my_stack__split_fields)))
  (=>
  (forall ((my_stack__split_fields1 us_split_fields)) (state__function_guard
  (state my_stack__split_fields1) my_stack__split_fields1))
  (=>
  (forall ((my_stack__split_fields1 us_split_fields)) (state__function_guard
  (state my_stack__split_fields1) my_stack__split_fields1))
  (let ((usf (state my_stack__split_fields)))
  (=>
  (forall ((my_stack__split_fields1 us_split_fields)) (state__function_guard
  (state my_stack__split_fields1) my_stack__split_fields1))
  (=>
  (forall ((my_stack__split_fields1 us_split_fields)) (state__function_guard
  (state my_stack__split_fields1) my_stack__split_fields1))
  (=> (dynamic_invariant temp false false true true)
  (forall ((temp___379 Int))
  (=>
  (= (to_rep1
     (rec__stack_functional_spec__stack_type__pointer my_stack__split_fields)) temp___379)
  (=> (and (<= 1 temp___379) (<= temp___379 100))
  (forall ((o Int))
  (=>
  (= (to_rep
     (select (rec__stack_functional_spec__stack_type__s
             my_stack__split_fields) temp___379)) o)
  (forall ((temp1 Int))
  (=> (= temp1 o)
  (forall ((o1 Int))
  (=>
  (= (to_rep1
     (rec__stack_functional_spec__stack_type__pointer my_stack__split_fields)) o1)
  (let ((temp___381 (- o1 1)))
  (=> (and (<= 1 temp___381) (<= temp___381 100))
  (forall ((o2 Int))
  (=>
  (= (to_rep
     (select (rec__stack_functional_spec__stack_type__s
             my_stack__split_fields) temp___381)) o2)
  (forall ((o3 integer))
  (=> (= (to_rep o3) o2)
  (forall ((temp___383 Int))
  (=>
  (= (to_rep1
     (rec__stack_functional_spec__stack_type__pointer my_stack__split_fields)) temp___383)
  (=> (and (<= 1 temp___383) (<= temp___383 100))
  (forall ((my_stack__split_fields1 us_split_fields))
  (=>
  (= my_stack__split_fields1 (us_split_fieldsqtmk
                             (store (rec__stack_functional_spec__stack_type__s
                                    my_stack__split_fields) temp___383 o3)
                             (rec__stack_functional_spec__stack_type__pointer
                             my_stack__split_fields)))
  (forall ((o4 integer))
  (=> (= (to_rep o4) temp1)
  (forall ((o5 Int))
  (=>
  (= (to_rep1
     (rec__stack_functional_spec__stack_type__pointer
     my_stack__split_fields1)) o5)
  (let ((temp___387 (- o5 1)))
  (=> (and (<= 1 temp___387) (<= temp___387 100))
  (forall ((my_stack__split_fields2 us_split_fields))
  (=>
  (= my_stack__split_fields2 (us_split_fieldsqtmk
                             (store (rec__stack_functional_spec__stack_type__s
                                    my_stack__split_fields1) temp___387 o4)
                             (rec__stack_functional_spec__stack_type__pointer
                             my_stack__split_fields1)))
  (=>
  (let ((o6 (state my_stack__split_fields2)))
  (and
  (and (state__function_guard o6 my_stack__split_fields2)
  (= o6 (us_repqtmk my_stack__split_fields2)))
  (let ((o7 (count o6)))
  (and (count__function_guard o7 o6)
  (and (dynamic_invariant1 o7 true false true true)
  (= o7 (to_rep1
        (rec__stack_functional_spec__stack_type__pointer
        (us_split_fields1 o6)))))))))
  (let ((o6 (state my_stack__split_fields2)))
  (=>
  (and (state__function_guard o6 my_stack__split_fields2)
  (= o6 (us_repqtmk my_stack__split_fields2)))
  (let ((o7 (count o6)))
  (=>
  (and (count__function_guard o7 o6)
  (and (dynamic_invariant1 o7 true false true true)
  (= o7 (to_rep1
        (rec__stack_functional_spec__stack_type__pointer
        (us_split_fields1 o6))))))
  (let ((o8 (stack_entry usf o7)))
  (=>
  (and (stack_entry__function_guard o8 usf o7)
  (and (dynamic_invariant o8 true false true true)
  (= o8 (to_rep
        (select (rec__stack_functional_spec__stack_type__s
                (us_split_fields1 usf)) o7)))))
  (let ((o9 (state my_stack__split_fields2)))
  (=>
  (and (state__function_guard o9 my_stack__split_fields2)
  (= o9 (us_repqtmk my_stack__split_fields2)))
  (let ((o10 (count o9)))
  (=>
  (and (count__function_guard o10 o9)
  (and (dynamic_invariant1 o10 true false true true)
  (= o10 (to_rep1
         (rec__stack_functional_spec__stack_type__pointer
         (us_split_fields1 o9))))))
  (in_range2 (- o10 1))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
