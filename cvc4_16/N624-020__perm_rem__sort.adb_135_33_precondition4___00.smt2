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

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

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
                           (= (to_rep (select a temp___idx_154)) (to_rep
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
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

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
  (forall ((x integer)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (index index) Bool)

(declare-const dummy3 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-fun is_perm (us_t us_t) Bool)

(declare-fun is_perm__function_guard (Bool us_t us_t) Bool)

(declare-fun invariant__ (us_t) Bool)

(declare-fun invariant____function_guard (Bool us_t) Bool)

(declare-fun remove (us_t Int) us_t)

(declare-fun remove__function_guard (us_t us_t Int) Bool)

;; is_perm__def_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (! (=> (is_perm__function_guard (is_perm a b) a b)
     (and
     (forall ((a1 us_t) (ia Int)) (remove__function_guard (remove a1 ia) a1
     ia))
     (and
     (forall ((b1 us_t) (ib Int)) (remove__function_guard (remove b1 ib) b1
     ib))
     (and
     (forall ((a1 us_t) (ia Int)) (remove__function_guard (remove a1 ia) a1
     ia))
     (and
     (forall ((b1 us_t) (ib Int)) (remove__function_guard (remove b1 ib) b1
     ib))
     (and
     (forall ((a1 us_t) (b1 us_t) (ia Int) (ib Int)) (is_perm__function_guard
     (is_perm (remove a1 ia) (remove b1 ib)) (remove a1 ia) (remove b1 ib)))
     (= (= (is_perm a b) true)
     (or (and (= (length a) 0) (= (length b) 0))
     (exists ((ia Int))
     (and (and (<= (first1 a) ia) (<= ia (last1 a)))
     (exists ((ib Int))
     (and (and (<= (first1 b) ib) (<= ib (last1 b)))
     (and
     (= (to_rep (select (to_array a) ia)) (to_rep (select (to_array b) ib)))
     (= (is_perm (remove a ia) (remove b ib)) true)))))))))))))) :pattern (
  (is_perm a b)) )))

(declare-sort tarray_typeP1 0)

(declare-fun tarray_typeP1qtint (tarray_typeP1) Int)

;; tarray_typeP1'axiom
  (assert
  (forall ((i tarray_typeP1))
  (and (<= 1 (tarray_typeP1qtint i)) (<= (tarray_typeP1qtint i) 100))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (tarray_typeP1 tarray_typeP1) Bool)

(declare-const dummy5 tarray_typeP1)

(declare-datatypes ((tarray_typeP1__ref 0))
(((tarray_typeP1__refqtmk (tarray_typeP1__content tarray_typeP1)))))
(define-fun tarray_typeP1__ref_tarray_typeP1__content__projection ((a tarray_typeP1__ref)) tarray_typeP1 
  (tarray_typeP1__content a))

(declare-fun perm_reflexive (us_t us_t) Int)

(declare-fun perm_reflexive__function_guard (Int us_t us_t) Bool)

(define-fun dynamic_invariant1 ((temp___expr_174 us_t)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool)
  (temp___do_typ_inv_173 Bool)) Bool (=>
                                     (not (= temp___skip_constant_171 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_174)
                                     (last1 temp___expr_174))))

(declare-sort true_bool 0)

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (true_bool true_bool) Bool)

(declare-const dummy6 true_bool)

(declare-datatypes ((true_bool__ref 0))
(((true_bool__refqtmk (true_bool__content true_bool)))))
(define-fun true_bool__ref_true_bool__content__projection ((a true_bool__ref)) true_bool 
  (true_bool__content a))

(define-fun dynamic_invariant2 ((temp___expr_218 Int)
  (temp___is_init_214 Bool) (temp___skip_constant_215 Bool)
  (temp___do_toplevel_216 Bool)
  (temp___do_typ_inv_217 Bool)) Bool (=>
                                     (or (= temp___is_init_214 true)
                                     (<= 1 1)) (in_range6 temp___expr_218)))

;; perm_reflexive__post_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (and
     (forall ((b1 us_t)) (invariant____function_guard (invariant__ b1) b1))
     (=>
     (and
     (and (dynamic_invariant1 a true true true true) (dynamic_invariant1 b
     true true true true))
     (and (and (= (invariant__ a) true) (= (invariant__ b) true))
     (= (bool_eq (to_array a) (first1 a) (last1 a) (to_array b) (first1 b)
        (last1 b)) true)))
     (let ((result (perm_reflexive a b)))
     (and
     (forall ((a1 us_t) (b1 us_t)) (is_perm__function_guard (is_perm a1 b1)
     a1 b1))
     (=> (perm_reflexive__function_guard result a b)
     (and (=> (= (distinct result 0) true) (= (is_perm a b) true))
     (dynamic_invariant2 result true false true true)))))))) :pattern (
  (perm_reflexive a b)) )))

(declare-fun perm_transitive (us_t us_t us_t) Int)

(declare-fun perm_transitive__function_guard (Int us_t us_t us_t) Bool)

;; perm_transitive__post_axiom
  (assert
  (forall ((a us_t) (b us_t) (c us_t))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (and
     (forall ((b1 us_t)) (invariant____function_guard (invariant__ b1) b1))
     (and
     (forall ((c1 us_t)) (invariant____function_guard (invariant__ c1) c1))
     (and
     (forall ((a1 us_t) (b1 us_t)) (is_perm__function_guard (is_perm a1 b1)
     a1 b1))
     (and
     (forall ((b1 us_t) (c1 us_t)) (is_perm__function_guard (is_perm b1 c1)
     b1 c1))
     (=>
     (and
     (and
     (and (dynamic_invariant1 a true true true true) (dynamic_invariant1 b
     true true true true)) (dynamic_invariant1 c true true true true))
     (and
     (and
     (and (and (= (invariant__ a) true) (= (invariant__ b) true))
     (= (invariant__ c) true)) (= (is_perm a b) true))
     (= (is_perm b c) true)))
     (let ((result (perm_transitive a b c)))
     (and
     (forall ((a1 us_t) (c1 us_t)) (is_perm__function_guard (is_perm a1 c1)
     a1 c1))
     (=> (perm_transitive__function_guard result a b c)
     (and (=> (= (distinct result 0) true) (= (is_perm a c) true))
     (dynamic_invariant2 result true false true true))))))))))) :pattern (
  (perm_transitive a b c)) )))

(declare-fun index_of_minimum ((Array Int natural) Int Int) Int)

(declare-fun index_of_minimum__function_guard (Int (Array Int natural) Int
  Int) Bool)

(define-fun dynamic_invariant3 ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 1 100)) (in_range4 temp___expr_167)))

;; index_of_minimum__post_axiom
  (assert
  (forall ((values (Array Int natural)))
  (forall ((first2 Int) (last2 Int))
  (! (=>
     (and
     (and (dynamic_invariant3 first2 true true true true) (dynamic_invariant3
     last2 true true true true))
     (and (and (<= first2 last2) (and (<= 1 first2) (<= first2 100)))
     (and (<= 1 last2) (<= last2 100))))
     (let ((result (index_of_minimum values first2 last2)))
     (=> (index_of_minimum__function_guard result values first2 last2)
     (and (and (<= first2 result) (<= result last2)) (dynamic_invariant
     result true false true true))))) :pattern ((index_of_minimum values
                                                first2 last2)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const init (Array Int natural))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort t7b 0)

(declare-fun t7bqtint (t7b) Int)

;; t7b'axiom
  (assert (forall ((i t7b)) (and (<= 1 (t7bqtint i)) (<= (t7bqtint i) 99))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 99)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (t7b t7b) Bool)

(declare-const dummy7 t7b)

(declare-datatypes ((t7b__ref 0))
(((t7b__refqtmk (t7b__content t7b)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) t7b (t7b__content
                                                                 a))

(define-fun dynamic_invariant4 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant5 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range3 temp___expr_18)))

;; invariant____post_axiom
  (assert true)

;; invariant____def_axiom
  (assert
  (forall ((a us_t))
  (! (= (= (invariant__ a) true) (and (= (first1 a) 1) (<= 0 (last1 a)))) :pattern (
  (invariant__ a)) )))

;; remove__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((i Int))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (=>
     (and
     (and (dynamic_invariant1 a true true true true) (dynamic_invariant3 i
     true true true true))
     (and (= (invariant__ a) true) (and (<= (first1 a) i) (<= i (last1 a)))))
     (let ((result (remove a i)))
     (and
     (forall ((result1 us_t)) (invariant____function_guard
     (invariant__ result1) result1))
     (=> (remove__function_guard result a i)
     (and
     (and
     (and
     (and
     (and (= (invariant__ result) true) (= (last1 result) (- (last1 a) 1)))
     (forall ((k Int))
     (=> (and (<= 1 k) (<= k (- i 1)))
     (= (to_rep (select (to_array a) k)) (to_rep
                                         (select (to_array result) k))))))
     (forall ((k Int))
     (=> (and (<= (+ i 1) k) (<= k (last1 a)))
     (= (to_rep (select (to_array a) k)) (to_rep
                                         (select (to_array result) (- k 1)))))))
     (forall ((k Int))
     (=> (and (<= i k) (<= k (- (last1 a) 1)))
     (= (to_rep (select (to_array a) (+ k 1))) (to_rep
                                               (select (to_array result) k))))))
     (dynamic_invariant1 result true false true true))))))) :pattern (
  (remove a i)) ))))

;; is_perm__post_axiom
  (assert
  (forall ((a us_t)) (invariant____function_guard (invariant__ a) a)))

(assert
;; defqtvc
 ;; File "sort.ads", line 7, characters 0-0
  (not
  (forall ((values (Array Int natural)) (smallest Int) (hr Int)
  (prec (Array Int natural)))
  (=> (dynamic_invariant smallest false false true true)
  (=> (= values init)
  (=> (= prec values)
  (=> (dynamic_invariant2 hr false false true true)
  (let ((o (of_array values 1 100)))
  (let ((o1 (of_array values 1 100)))
  (let ((o2 (perm_reflexive o1 o)))
  (=>
  (forall ((o3 us_t) (o4 us_t)) (is_perm__function_guard (is_perm o4 o3) o4
  o3))
  (=>
  (and (perm_reflexive__function_guard o2 o1 o)
  (and (dynamic_invariant2 o2 true false true true)
  (=> (= (distinct o2 0) true) (= (is_perm o1 o) true))))
  (forall ((hr1 Int))
  (=> (= hr1 o2)
  (forall ((current Int))
  (=> (= current 1)
  (=>
  (= (and (ite (<= 1 current) true false) (ite (<= current 99) true false)) true)
  (forall ((temp___loop_entry_305 (Array Int natural)))
  (=> (= temp___loop_entry_305 values)
  (let ((o3 (index_of_minimum values current 100)))
  (=>
  (and (index_of_minimum__function_guard o3 values current 100)
  (and (dynamic_invariant o3 true false true true)
  (and (<= current o3) (<= o3 100))))
  (forall ((smallest1 Int))
  (=> (= smallest1 o3)
  (forall ((spark__branch Bool) (values1 (Array Int natural))
  (prec1 (Array Int natural)) (hr2 Int))
  (=>
  (forall ((values2 (Array Int natural)) (values3 (Array Int natural)))
  (is_perm__function_guard
  (is_perm (of_array values2 1 100) (of_array values3 1 100))
  (of_array values2 1 100) (of_array values3 1 100)))
  (=>
  (forall ((o4 us_t) (o5 us_t)) (is_perm__function_guard (is_perm o5 o4) o5
  o4))
  (=>
  (and (= spark__branch (ite (= smallest1 current) false true))
  (ite (= spark__branch true)
  (and (= prec1 values)
  (and (= (is_perm (of_array values 1 100) (of_array values1 1 100)) true)
  (let ((o4 (of_array values1 1 100)))
  (let ((o5 (of_array prec1 1 100)))
  (let ((o6 (of_array init 1 100)))
  (let ((o7 (perm_transitive o6 o5 o4)))
  (and
  (and (perm_transitive__function_guard o7 o6 o5 o4)
  (and (dynamic_invariant2 o7 true false true true)
  (=> (= (distinct o7 0) true) (= (is_perm o6 o4) true)))) (= hr2 o7))))))))
  (and (and (= values1 values) (= prec1 prec)) (= hr2 hr1))))
  (=> (forall ((o4 us_t)) (invariant____function_guard (invariant__ o4) o4))
  (= (invariant__ (of_array temp___loop_entry_305 1 100)) true)))))))))))))))))))))))))))))
(check-sat)
(exit)
