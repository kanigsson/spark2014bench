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
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
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

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((array_type__ref 0))
(((array_type__refqtmk (array_type__content us_t)))))
(define-fun array_type__ref_array_type__content__projection ((a array_type__ref)) us_t 
  (array_type__content a))

(declare-fun perm (us_t us_t) Bool)

(declare-fun perm__function_guard (Bool us_t us_t) Bool)

(define-fun dynamic_invariant1 ((temp___expr_162 us_t)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (not (= temp___skip_constant_159 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_162)
                                     (last1 temp___expr_162))))

;; perm__post_axiom
  (assert true)

(declare-const values__first integer)

(declare-const values__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun perm_transitive (us_t us_t us_t) Bool)

(declare-fun perm_transitive__function_guard (Bool us_t us_t us_t) Bool)

;; perm_transitive__post_axiom
  (assert
  (forall ((a us_t) (b us_t) (c us_t))
  (! (=>
     (and
     (and (dynamic_invariant1 a true true true true) (dynamic_invariant1 b
     true true true true)) (dynamic_invariant1 c true true true true))
     (let ((result (perm_transitive a b c)))
     (and
     (forall ((a1 us_t) (b1 us_t)) (perm__function_guard (perm a1 b1) a1 b1))
     (and
     (forall ((b1 us_t) (c1 us_t)) (perm__function_guard (perm b1 c1) b1 c1))
     (and
     (forall ((a1 us_t) (c1 us_t)) (perm__function_guard (perm a1 c1) a1 c1))
     (=> (perm_transitive__function_guard result a b c)
     (=> (and (and (= result true) (= (perm a b) true)) (= (perm b c) true))
     (= (perm a c) true)))))))) :pattern ((perm_transitive a b c)) )))

(declare-fun index_of_minimum (us_t) Int)

(declare-fun index_of_minimum__function_guard (Int us_t) Bool)

;; index_of_minimum__post_axiom
  (assert
  (forall ((unsorted us_t))
  (! (=>
     (and (dynamic_invariant1 unsorted true true true true)
     (<= (first1 unsorted) (last1 unsorted)))
     (let ((result (index_of_minimum unsorted)))
     (=> (index_of_minimum__function_guard result unsorted)
     (and
     (and (and (<= (first1 unsorted) result) (<= result (last1 unsorted)))
     (forall ((j Int))
     (=> (and (<= (first1 unsorted) j) (<= j (last1 unsorted)))
     (<= (to_rep (select (to_array unsorted) result)) (to_rep
                                                      (select (to_array
                                                              unsorted) j))))))
     (dynamic_invariant result true false true true))))) :pattern ((index_of_minimum
                                                                   unsorted)) )))

(declare-const values_last__first integer)

(declare-const values_last__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-datatypes ((tvalues_lastS__ref 0))
(((tvalues_lastS__refqtmk (tvalues_lastS__content us_t)))))
(define-fun tvalues_lastS__ref_tvalues_lastS__content__projection ((a tvalues_lastS__ref)) us_t 
  (tvalues_lastS__content a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes ((t19b__ref 0))
(((t19b__refqtmk (t19b__content integer)))))
(define-fun t19b__ref_t19b__content__projection ((a t19b__ref)) integer 
  (t19b__content a))

(declare-datatypes ((t23b__ref 0))
(((t23b__refqtmk (t23b__content us_t)))))
(define-fun t23b__ref_t23b__content__projection ((a t23b__ref)) us_t 
  (t23b__content a))

(define-fun dynamic_invariant2 ((temp___expr_217 us_t)
  (temp___is_init_213 Bool) (temp___skip_constant_214 Bool)
  (temp___do_toplevel_215 Bool)
  (temp___do_typ_inv_216 Bool)) Bool (=>
                                     (not (= temp___skip_constant_214 true))
                                     (and (dynamic_property
                                     (to_rep values__first)
                                     (to_rep values__last)
                                     (first1 temp___expr_217)
                                     (last1 temp___expr_217))
                                     (and
                                     (= (first1 temp___expr_217) (to_rep
                                                                 values__first))
                                     (= (last1 temp___expr_217) (to_rep
                                                                values__last))))))

(define-fun default_initial_assumption ((temp___expr_219 us_t)
  (temp___skip_top_level_220 Bool)) Bool (and
                                         (= (first1 temp___expr_219) 
                                         (to_rep values__first))
                                         (= (last1 temp___expr_219) (to_rep
                                                                    values__last))))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(assert
;; defqtvc
 ;; File "sorters.ads", line 15, characters 0-0
  (not
  (forall ((values (Array Int integer)) (values_last (Array Int integer))
  (smallest Int) (temp___228 Int) (o Int))
  (=> (dynamic_property 1 2147483647 (to_rep values__first)
  (to_rep values__last))
  (=> (<= 1 (length (to_rep values__first) (to_rep values__last)))
  (=> (<= (to_rep values__last) 2147483647)
  (=> (default_initial_assumption
  (of_array values_last (to_rep values_last__first)
  (to_rep values_last__last)) false)
  (=>
  (and (dynamic_property (to_rep values__first) (to_rep values__last)
  (to_rep values_last__first) (to_rep values_last__last))
  (and (= (to_rep values_last__first) (to_rep values__first))
  (= (to_rep values_last__last) (to_rep values__last))))
  (=> (dynamic_invariant smallest false false true true)
  (=>
  (forall ((values1 (Array Int integer))) (perm__function_guard
  (perm (of_array values1 (to_rep values__first) (to_rep values__last))
  (of_array values1 (to_rep values__first) (to_rep values__last)))
  (of_array values1 (to_rep values__first) (to_rep values__last))
  (of_array values1 (to_rep values__first) (to_rep values__last))))
  (=>
  (= (perm (of_array values (to_rep values__first) (to_rep values__last))
     (of_array values (to_rep values__first) (to_rep values__last))) true)
  (=> (= (to_rep values__first) temp___228)
  (=> (= (to_rep values__last) o)
  (let ((o1 (- o 1)))
  (=> (in_range1 o1)
  (forall ((current Int))
  (=> (= current temp___228)
  (=>
  (= (and (ite (<= temp___228 current) true false) (ite (<= current o1) true
                                                   false)) true)
  (forall ((temp___loop_entry_245 (Array Int integer)))
  (=> (= temp___loop_entry_245 values)
  (forall ((temp___loop_entry_233 (Array Int integer)))
  (=> (= temp___loop_entry_233 values)
  (=>
  (ite (<= (to_rep values__first) (to_rep values__last))
  (<= (to_rep values__first) (to_rep values__last))
  (< (to_rep values__last) (to_rep values__first)))
  (forall ((o2 Int))
  (=> (= (to_rep values__last) o2)
  (forall ((o3 Int))
  (=> (= (to_rep values__first) o3)
  (forall ((o4 Int))
  (=> (= (to_rep values__first) o4)
  (forall ((o5 Int))
  (=> (= (to_rep values__first) o5)
  (let ((temp___230 (of_array (slide values o5 o4) o3 o2)))
  (=>
  (ite (<= (first1 temp___230) (last1 temp___230))
  (and (<= (to_rep values_last__first) (to_rep values_last__last))
  (= (- (last1 temp___230) (first1 temp___230)) (- (to_rep values_last__last) 
  (to_rep values_last__first))))
  (< (to_rep values_last__last) (to_rep values_last__first)))
  (forall ((values_last1 (Array Int integer)))
  (=> (= values_last1 (to_array temp___230))
  (forall ((temp___231 Int))
  (=> (= (to_rep values__last) temp___231)
  (=>
  (=> (<= current temp___231)
  (and
  (and (<= (to_rep values__first) current)
  (<= current (to_rep values__last)))
  (and (<= (to_rep values__first) temp___231)
  (<= temp___231 (to_rep values__last)))))
  (let ((temp___232 (of_array values current temp___231)))
  (let ((o6 (of_array (to_array temp___232) (first1 temp___232)
            (last1 temp___232))))
  (let ((o7 (index_of_minimum o6)))
  (=>
  (and (index_of_minimum__function_guard o7 o6)
  (and (dynamic_invariant o7 true false true true)
  (and (and (<= (first1 o6) o7) (<= o7 (last1 o6)))
  (forall ((j Int))
  (=> (and (<= (first1 o6) j) (<= j (last1 o6)))
  (<= (to_rep (select (to_array o6) o7)) (to_rep (select (to_array o6) j))))))))
  (forall ((smallest1 Int))
  (=> (= smallest1 o7)
  (forall ((spark__branch Bool) (values1 (Array Int integer)))
  (=>
  (forall ((values2 (Array Int integer)) (o8 integer) (o9 integer)
  (o10 (Array Int integer))) (perm__function_guard
  (perm (of_array values2 (to_rep o9) (to_rep o8))
  (of_array o10 (to_rep o9) (to_rep o8)))
  (of_array values2 (to_rep o9) (to_rep o8))
  (of_array o10 (to_rep o9) (to_rep o8))))
  (=>
  (and (= spark__branch (ite (= smallest1 current) false true))
  (ite (= spark__branch true)
  (and (in_range2 current)
  (let ((o8 values__last))
  (let ((o9 values__first))
  (exists ((o10 (Array Int integer)))
  (and (= o10 values1)
  (and
  (= (perm (of_array values (to_rep o9) (to_rep o8))
     (of_array o10 (to_rep o9) (to_rep o8))) true)
  (and
  (and (= (to_rep (select o10 current)) (to_rep (select values smallest1)))
  (= (to_rep (select o10 smallest1)) (to_rep (select values current))))
  (forall ((j Int))
  (=> (and (<= (to_rep o9) j) (<= j (to_rep o8)))
  (=> (and (not (= j current)) (not (= j smallest1)))
  (= (to_rep (select o10 j)) (to_rep (select values j)))))))))))))
  (= values1 values)))
  (=>
  (forall ((temp___loop_entry_2331 (Array Int integer))
  (values_last2 (Array Int integer)) (values2 (Array Int integer)))
  (perm_transitive__function_guard
  (perm_transitive
  (of_array temp___loop_entry_2331 (to_rep values__first)
  (to_rep values__last))
  (of_array values_last2 (to_rep values_last__first)
  (to_rep values_last__last))
  (of_array values2 (to_rep values__first) (to_rep values__last)))
  (of_array temp___loop_entry_2331 (to_rep values__first)
  (to_rep values__last))
  (of_array values_last2 (to_rep values_last__first)
  (to_rep values_last__last))
  (of_array values2 (to_rep values__first) (to_rep values__last))))
  (=>
  (= (perm_transitive
     (of_array temp___loop_entry_233 (to_rep values__first)
     (to_rep values__last))
     (of_array values_last1 (to_rep values_last__first)
     (to_rep values_last__last))
     (of_array values1 (to_rep values__first) (to_rep values__last))) true)
  (forall ((o8 Int))
  (=> (= (to_rep values__last) o8)
  (forall ((o9 Int))
  (=> (= (to_rep values__first) o9)
  (let ((o10 (of_array values1 o9 o8)))
  (forall ((o11 Int))
  (=> (= (to_rep values__last) o11)
  (forall ((o12 Int))
  (=> (= (to_rep values__first) o12)
  (let ((o13 (of_array temp___loop_entry_245 o12 o11)))
  (=> (perm__function_guard (perm o13 o10) o13 o10)
  (=>
  (forall ((temp___loop_entry_2451 (Array Int integer))
  (values2 (Array Int integer))) (perm__function_guard
  (perm
  (of_array temp___loop_entry_2451 (to_rep values__first)
  (to_rep values__last))
  (of_array values2 (to_rep values__first) (to_rep values__last)))
  (of_array temp___loop_entry_2451 (to_rep values__first)
  (to_rep values__last))
  (of_array values2 (to_rep values__first) (to_rep values__last))))
  (= (perm
     (of_array temp___loop_entry_245 (to_rep values__first)
     (to_rep values__last))
     (of_array values1 (to_rep values__first) (to_rep values__last))) true))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
